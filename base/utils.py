import urllib.parse
from base.models import Category


def wrap_function(func):
    def wrapped(root):
        items = []
        items += list(root.items.all())
        func(root)
        return items
    return wrapped


@wrap_function
def recursion(root):
    for child in root.child.all():
        recursion(child)


def get_page(paginator, params):
    params = params.copy()
    current_page = int(params.get('page', 1))
    page = {'items': paginator.get_page(current_page)}
    prev_page = current_page - 1
    next_page = current_page + 1
    if prev_page > 0:
        params['page'] = prev_page
        page['prev_page'] = '?{0}'.format(urllib.parse.urlencode(params))
    if next_page > current_page:
        params['page'] = next_page
        page['next_page'] = '?{0}'.format(urllib.parse.urlencode(params))

    return page


def create_breadcrumb(slugs):
    breadcrumbs = []
    url = '/'
    for slug in slugs:
        url = '{0}{1}/'.format(url, slug)
        try:
            name = Category.objects.get(slug=slug)
        except Category.DoesNotExist:
            pass
        breadcrumb = {'slug': slug, 'url': url, 'name': name}
    breadcrumbs.append(breadcrumb)
    return breadcrumbs
