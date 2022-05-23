import urllib.parse
from base.models import Category, Item


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


def tree():
    categories = Category.objects.values()
    parents = [no_parent for no_parent in categories if not no_parent['parent_id']]

    for parent in parents:
        parent['path'] = parent['slug']

    def wrap(elements):
        for element in elements:
            element['child'] = [category for category in categories if element['id'] == category['parent_id']]
            element['items'] = []

            element['path'] = '{}{}'.format(element['path'], '/')
            for child in element['child']:
                child['path'] = '{}{}'.format(element['path'], child['slug'])
            element['path'] = '{}{}'.format('/', element['path'])
            wrap([category for category in categories if element['id'] == category['parent_id']])

    wrap(parents)
    return parents


def dfs(categories, slug):
    a = []

    def search(cats, path):
        for category in cats:
            if category['slug'] == path:
                a.append(category)
            else:
                search(category['child'], path)
    search(categories, slug)
    return a


def create_bread(categories, slugs):
    breadcrumbs = []
    for slug in slugs:
        breadcrumbs += list(dfs(categories, slug))
    breadcrumbs = [{'slug': slugs, 'url': '/', 'name': slugs}] if not breadcrumbs else breadcrumbs
    return breadcrumbs


def get_items(categories, slugs):
    items = Item.objects.values()
    current_categories = []

    for slug in slugs:
        current_categories += list(dfs(categories, slug))
    current_categories = [current_categories[-1]]

    def wrap(cats, objects, cur_items):
        for cat in cats:
            cur_items += list([item for item in objects if item['category_id'] == cat['id']])
            if cat['child']:
                wrap(cat['child'], objects, cur_items)

    current_items = []
    wrap(current_categories, items, current_items)
    return current_items

