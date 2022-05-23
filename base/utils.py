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

            element['path'] = '{}{}'.format(element['path'], '/')
            for child in element['child']:
                child['path'] = '{}{}'.format(element['path'], child['slug'])
            element['path'] = '{}{}'.format('/', element['path'])

            wrap([category for category in categories if element['id'] == category['parent_id']])

    wrap(parents)
    return parents


def dfs(categories, slug):
    a = []

    def search(cats, slugs):
        for category in cats:
            if category['slug'] == slugs:
                a.append(category)
            else:
                search(category['child'], slugs)
    search(categories, slug)
    return a[0]


def create_bread(categories, slugs):
    breadcrumbs = [(dfs(categories, slug)) for slug in slugs]
    breadcrumbs = [{'slug': slugs, 'url': '/', 'name': slugs}] if not breadcrumbs else breadcrumbs
    return breadcrumbs


def get_items(categories, slugs):
    current_categories = [dfs(categories, slug) for slug in slugs][-1]

    def wrap(cats, cur_items):
        for cat in cats:
            cur_items += [cat['id']]
            if cat['child']:
                wrap(cat['child'], cur_items)

    current_items = []
    wrap([current_categories], current_items)
    return Item.objects.filter(category__in=current_items)