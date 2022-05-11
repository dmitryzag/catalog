from urllib.parse import urlparse


def recursion(root, items):
    items += list(root.items.all())
    for child in root.child.all():
        recursion(child, items)


def get_page(paginator, page_obj, req):
    if paginator.count > 1:
        page = page_obj.next_page_number() if page_obj.has_next() else page_obj.previous_page_number()

        if req.GET and not req.GET.get('page'):
            num_page = '?page={0}'.format(page)
            for i, v in req.GET.dict().items():
                num_page += '&{0}={1}'.format(i, v)
        elif 'page' in req.GET.dict() and len(req.GET.dict()) >= 2:
            for i, v in req.GET.dict().items():
                if i != 'page':
                    num_page = '?page={0}&{1}={2}'.format(page, i, v)
        else:
            num_page = '?page={0}'.format(page)
