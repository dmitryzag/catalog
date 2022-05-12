import urllib.parse
from urllib.parse import urlparse

from base.models import Category


def recursion(root, items):
    items += list(root.items.all())
    for child in root.child.all():
        recursion(child, items)


def get_page(paginator, page_obj, req):
    page_next = page_obj.next_page_number() if page_obj.has_next() else None
    page_previous = page_obj.previous_page_number() if page_obj.has_previous() else None
    pages = {}
    if paginator.count > 1:
        if req.GET and not req.GET.get('page'):
            page_next = '?page={0}'.format(page_next) if page_next else ''
            page_previous = '?page={0}'.format(page_previous) if page_previous else ''
            for i, v in req.GET.dict().items():
                page_next += '&{0}={1}'.format(i, v) if page_next else ''
                page_previous += '&{0}={1}'.format(i, v) if page_previous else ''
            pages = {'next': page_next, 'previous': page_previous}
        elif 'page' in req.GET.dict() and len(req.GET.dict()) >= 2:
            key_value = []
            for i, v in req.GET.dict().items():
                if i != 'page':
                    key_value.append((i, v))
            page_next = '?page={0}&{1}'.format(page_next, urllib.parse.urlencode(key_value))
            page_previous = '?page={0}&{1}'.format(page_previous, urllib.parse.urlencode(key_value))
            pages = {'next': page_next, 'previous': page_previous}
        else:
            page_next = '?page={0}'.format(page_next) if page_next else ''
            page_previous = '?page={0}'.format(page_previous) if page_previous else ''
            pages = {'next': page_next, 'previous': page_previous}
    return pages


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
