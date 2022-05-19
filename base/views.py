from django.shortcuts import render
from .models import Item
from django.core.paginator import Paginator
from .utils import get_page, tree, bread, get_items, lost_image


def catalog(req, args):
    slugs = list(filter(lambda elm: elm != '', args.split('/')))
    items = get_items(slugs[-1])
    paginator = Paginator(items, 12)
    page = get_page(paginator, req.GET)
    categories = tree()
    breadcrumbs = bread(slugs)
    context = {'categories': categories, 'breadcrumbs': breadcrumbs, 'page': page}

    return render(req, 'main.html', context)


def search(req):
    slug = 'Поиск'
    categories = tree()
    items = Item.objects.filter(desc__icontains=req.GET.get('search', 1))

    breadcrumbs = bread(slug)
    paginator = Paginator(items, 12)
    page = get_page(paginator, req.GET)

    context = {'categories': categories, 'page': page, 'breadcrumbs': breadcrumbs}
    return render(req, 'main.html', context)
