from django.shortcuts import render
from .models import Item
from django.core.paginator import Paginator
from .utils import get_page, tree, create_bread, get_items
from django.http import JsonResponse
from django.template.loader import render_to_string
from django.http import Http404


def catalog(req, args):
    slugs = list(filter(lambda elm: elm != '', args.split('/')))
    categories = tree()
    try:
        items = get_items(categories, ''.join(slugs[-1:]))
    except TypeError:
        raise Http404
    paginator = Paginator(items, 12)
    page = get_page(paginator, req.GET)
    breadcrumbs = create_bread(categories, slugs) if slugs else ''
    context = {'categories': categories, 'breadcrumbs': breadcrumbs, 'page': page}

    if req.method == 'POST':
        rendered = render_to_string('catalog.html', context)
        return JsonResponse({'rendered': rendered})
    return render(req, 'main.html', context)


def search(req):
    categories = tree()
    items = Item.objects.filter(desc__icontains=req.GET.get('search', 1))
    breadcrumbs = [{'slug': 'Поиск', 'url': '/', 'name': 'Поиск'}]
    paginator = Paginator(items, 12)
    page = get_page(paginator, req.GET)

    context = {'categories': categories, 'page': page, 'breadcrumbs': breadcrumbs}
    return render(req, 'main.html', context)
