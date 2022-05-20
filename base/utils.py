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

    def wrap(parents):
        for parent in parents:
            parent['child'] = [category for category in categories if parent['id'] == category['parent_id']]
            parent['items'] = []

            parent['path'] = '{}{}'.format(parent['path'], '/')
            for child in parent['child']:
                child['path'] = '{}{}'.format(parent['path'], child['slug'])
            parent['path'] = '{}{}'.format('/', parent['path'])
            wrap([category for category in categories if parent['id'] == category['parent_id']])

    wrap(parents)
    return parents


def get_items(categories, slugs):
    items = Item.objects.values()

    def wrap(cats):
        for cat in cats:
            for item in items:
                if item['category_id'] == cat['id']:
                    cat['items'].append(item)
            wrap(cat['child'])

    def find_items(cats, arr):
        for cat in cats:
            if cat['path'].count(slugs):
                arr += list(cat['items'])
            find_items(cat['child'], arr)
        return arr

    wrap(categories)
    a = find_items(categories, arr=[])
    return a


def create_bread(categories, slugs):
    breadcrumbs = []

    def dfs(categories, slugs):
        for slug in slugs:
            for category in categories:
                if category['slug'] == slug:
                    breadcrumb = {'slug': slug, 'url': category['path'], 'name': category['name']}
                    breadcrumbs.append(breadcrumb)
                    slugs.pop(slugs.index(slug))
                    dfs(category['child'], slugs)

    dfs(categories, slugs)
    breadcrumbs = [{'slug': slugs, 'url': '/', 'name': slugs}] if not breadcrumbs else breadcrumbs
    return breadcrumbs
