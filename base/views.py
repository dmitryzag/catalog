from django.shortcuts import render
from .models import Item, Category
from django.core.paginator import Paginator
from .utils import recursion, get_page, breadcrumb, clear_items
from django.http import Http404


def catalog(req, args):
    slugs = list(filter(lambda elm: elm != '', args.split('/')))

    try:
        active_category = Category.objects.get(slug=slugs[-1])
    except:
        raise Http404()

    items = recursion(active_category)
    paginator = Paginator(items, 12)
    page = get_page(paginator, req.GET)
    categories = Category.objects.filter(parent__isnull=True)
    breadcrumbs = breadcrumb(slugs)
    context = {'categories': categories, 'breadcrumbs': breadcrumbs, 'page': page}
    clear_items()

    return render(req, 'main.html', context)


def search(req):
    slugs = ['Поиск']
    categories = Category.objects.filter(parent__isnull=True)
    items = Item.objects.filter(desc__icontains=req.GET.get('search', 1))

    breadcrumbs = breadcrumb(slugs)
    paginator = Paginator(items, 12)
    page = get_page(paginator, req.GET)

    context = {'categories': categories, 'page': page, 'breadcrumbs': breadcrumbs}
    return render(req, 'main.html', context)
