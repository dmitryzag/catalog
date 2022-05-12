from django.shortcuts import render
from .models import Item, Category
from django.core.paginator import Paginator
from .utils import recursion, get_page, breadcrumb


def catalog(req, args):
    tests = []
    slugs = list(filter(lambda elm: elm != '', args.split('/')))
    print(slugs)
    try:
        active_category = Category.objects.get(slug=slugs[-1])
        recursion(active_category, tests)
    except:
        print(Category.DoesNotExist)

    items = [] if not slugs else Item.objects.filter(category__slug=slugs[-1])

    paginator = Paginator(tests, 12)
    page_number = req.GET.get('page')
    page_obj = paginator.get_page(page_number)
    page = get_page(paginator, page_obj, req)

    categories = Category.objects.filter(parent__isnull=True)
    breadcrumbs = []
    breadcrumb(slugs, breadcrumbs)

    context = {'categories': categories, 'breadcrumbs': breadcrumbs, 'items': items, 'page_obj': page_obj, 'tests': tests, 'page': page}
    return render(req, 'main.html', context)


def search(req):
    slugs = ['Поиск']
    breadcrumbs = []
    breadcrumb(slugs, breadcrumbs)
    print(breadcrumbs)
    items = Item.objects.filter(desc__icontains=req.GET.get('search', 1))
    paginator = Paginator(items, 12)
    page_number = req.GET.get('page', 1)
    page_obj = paginator.page(page_number)
    page = get_page(paginator, page_obj, req)

    categories = Category.objects.filter(parent__isnull=True)
    context = {'page_obj': page_obj, 'categories': categories, 'page_number': page_number, 'page': page, 'breadcrumbs': breadcrumbs}
    return render(req, 'main.html', context)
