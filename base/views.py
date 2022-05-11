from django.shortcuts import render
from .models import Item, Category
from django.core.paginator import Paginator
from .utils import recursion


def catalog(req, args):
    tests = []
    slugs = list(filter(lambda elm: elm != '', args.split('/')))

    active_category = Category.objects.get(slug=slugs[-1])

    items = [] if not slugs else Item.objects.filter(category__slug=slugs[-1])

    recursion(active_category, tests)

    paginator = Paginator(tests, 12)
    page_number = req.GET.get('page')
    page_obj = paginator.get_page(page_number)

    categories = Category.objects.filter(parent__isnull=True)
    breadcrumbs = []
    url = '/'

    for slug in slugs:
        url = '{0}{1}/'.format(url, slug)
        name = Category.objects.get(slug=slug)
        breadcrumb = {'slug': slug, 'url': url, 'name': name}
        breadcrumbs.append(breadcrumb)

    num_page = ''
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

    context = {'categories': categories, 'breadcrumbs': breadcrumbs, 'items': items, 'page_obj': page_obj, 'tests': tests, 'num_page': num_page}
    return render(req, 'main.html', context)


def search(req):
    items = Item.objects.filter(desc__icontains=req.GET.get('search', 1))

    paginator = Paginator(items, 12)
    page_number = req.GET.get('page', 1)
    page_obj = paginator.page(page_number)

    num_page = ''
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

    categories = Category.objects.filter(parent__isnull=True)
    context = {'page_obj': page_obj, 'categories': categories, 'page_number': page_number, 'num_page': num_page}
    return render(req, 'main.html', context)
