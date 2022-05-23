from django.shortcuts import render
from .models import Item
from django.core.paginator import Paginator
from .utils import get_page, tree, create_bread, get_items


def catalog(req, args):
    slugs = list(filter(lambda elm: elm != '', args.split('/')))
    categories = tree()

    items = [] if not slugs else get_items(categories, slugs[-1])

    paginator = Paginator(items, 12)
    page = get_page(paginator, req.GET)
    breadcrumbs = create_bread(categories, slugs)

    context = {'categories': categories, 'breadcrumbs': breadcrumbs, 'page': page}
    return render(req, 'main.html', context)


def search(req):
    slug = 'Поиск'
    categories = tree()
    items = Item.objects.filter(desc__icontains=req.GET.get('search', 1))

    breadcrumbs = create_bread(categories, slug)
    paginator = Paginator(items, 12)
    page = get_page(paginator, req.GET)

    context = {'categories': categories, 'page': page, 'breadcrumbs': breadcrumbs}
    return render(req, 'main.html', context)
