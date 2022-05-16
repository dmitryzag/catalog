from django.shortcuts import render
from .models import Item, Category
from django.core.paginator import Paginator
from .utils import list_of_items, get_page, create_breadcrumb, tree
from django.http import Http404


def catalog(req, args):
    slugs = list(filter(lambda elm: elm != '', args.split('/')))

    try:
        active_category = Category.objects.get(slug=slugs[-1])
    except:
        raise Http404()

    # items = list_of_items(active_category)
    items = []
    paginator = Paginator(items, 12)
    page = get_page(paginator, req.GET)
    categories = Category.objects.values()
    tree(categories)
    breadcrumbs = create_breadcrumb(slugs)
    context = {'categories': categories, 'breadcrumbs': breadcrumbs, 'page': page}
    return render(req, 'main.html', context)


def search(req):
    slug = ['Поиск']
    categories = Category.objects.filter(parent__isnull=True)
    items = Item.objects.filter(desc__icontains=req.GET.get('search', 1))

    breadcrumbs = create_breadcrumb(slug)
    paginator = Paginator(items, 12)
    page = get_page(paginator, req.GET)

    context = {'categories': categories, 'page': page, 'breadcrumbs': breadcrumbs}
    return render(req, 'main.html', context)
