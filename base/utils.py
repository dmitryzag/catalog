import urllib.parse
from urllib.parse import urlparse

from base.models import Category


# def recursion(root, items):
#     items += list(root.items.all())
#     for child in root.child.all():
#         print(items)
#         recursion(child, items)

items = []

def recursion(root):
    global items
    items += list(root.items.all())
    for child in root.child.all():
        print(items)
        recursion(child)
    return items


def clear_items():
    global items
    items.clear()


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


def breadcrumb(slugs, breadcrumbs):
    url = '/'
    for slug in slugs:
        url = '{0}{1}/'.format(url, slug)
        try:
            name = Category.objects.get(slug=slug)
            breadcrumb = {'slug': slug, 'url': url, 'name': name}
            breadcrumbs.append(breadcrumb)
        except Category.DoesNotExist:
            breadcrumb = {'slug': slug, 'url': slug, 'name': slug}
            breadcrumbs.append(breadcrumb)
