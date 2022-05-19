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
    for category in categories:
        category['items'] = []
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


def bread(slugs):
    categories = Category.objects.values()
    breadcrumbs = []
    url = '/'

    for slug in slugs:
        url = '{0}{1}/'.format(url, slug)
        for category in categories:
            if category['slug'] == slug:
                breadcrumbs.append({'slug': slug, 'url': url, 'name': category['name']})

    breadcrumbs = [{'slug': slugs, 'url': url, 'name': slugs}] if not breadcrumbs else breadcrumbs
    return breadcrumbs


def list_of_items(root):
    a = []

    def recursion(wrap_root, items):
        items += list(wrap_root.items.all())
        for child in wrap_root.child.all():
            recursion(child, items)
        return items

    a = recursion(root, a)
    return a


def get_items(slugs):
    cats = tree()
    # cats = [cat for cat in cats if cat['slug'] == slugs]
    items = Item.objects.values()

    def wrap(categories):
        for category in categories:
            for item in items:
                if item['category_id'] == category['id']:
                    category['items'].append(item)
            wrap(category['child'])

    def find_items(categories, a):
        for category in categories:
            if category['path'].count(slugs):
                a += list(category['items'])
            find_items(category['child'], a)
        return a

    a = []
    wrap(cats)
    a = find_items(cats, a)
    return a
