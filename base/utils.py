import urllib.parse
from base.models import Category


def list_of_items(root):
    a = []

    def recursion(wrap_root, items):
        items += list(wrap_root.items.all())
        for child in wrap_root.child.all():
            recursion(child, items)
        return items

    a = recursion(root, a)
    return a


def get_page(paginator, params):
    params = params.copy()
    try:
        current_page = int(params.get('page', 1))
    except ValueError:
        current_page = 1
    page = {'items': paginator.get_page(current_page)}
    prev_page = current_page - 1
    if prev_page > 0:
        params['page'] = prev_page
        page['prev_page'] = '?{0}'.format(urllib.parse.urlencode(params))

    next_page = current_page + 1
    if paginator.num_pages - next_page >= 0:
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
            name = slug
        breadcrumb = {'slug': slug, 'url': url, 'name': name}
        breadcrumbs.append(breadcrumb)
    return breadcrumbs


def tree():
    categories = Category.objects.values()
    parents = [no_parent for no_parent in categories if not no_parent['parent_id']]

    for parent in parents:
        parent['path'] = parent['slug']

    def wrap(parents):
        for parent in parents:
            parent['child'] = [category for category in categories if parent['id'] == category['parent_id']]
            parent['path'] = '{}{}'.format(parent['path'], '/')
            for child in parent['child']:
                child['path'] = '{}{}'.format(parent['path'], child['slug'])
            parent['path'] = '{}{}'.format('/', parent['path'])
            wrap([category for category in categories if parent['id'] == category['parent_id']])

    wrap(parents)
    return parents

