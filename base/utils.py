import urllib.parse
from base.models import Category, Item
from django.db.models import Q


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

    def wrap(elements, parent_path='/'):
        for element in elements:
            element['child'] = [category for category in categories if element['id'] == category['parent_id']]
            element['path'] = f"{parent_path}{element['slug']}/"
            wrap([category for category in categories if element['id'] == category['parent_id']], element['path'])

    wrap(parents)
    return parents


def dfs(categories, slug):
    for category in categories:
        if category['slug'] == slug:
            return category

    for category in categories:
        result = dfs(category['child'], slug)
        if result:
            return result


def create_bread(categories, slugs):
    breadcrumbs = [(dfs(categories, slug)) for slug in slugs if (dfs(categories, slug)) is not None]
    breadcrumbs = [{'slug': slugs, 'url': '/', 'name': slugs}] if not breadcrumbs else breadcrumbs
    return breadcrumbs


def get_items(categories, slug):
    current_categories = [dfs(categories, slug)]

    def wrap(cats, cur_items):
        for cat in cats:
            cur_items.append(cat['id'])
            if cat['child']:
                wrap(cat['child'], cur_items)

    current_items = []
    if slug:
        wrap(current_categories, current_items)
    return Item.objects.filter(category__in=current_items) | Item.objects.all()


