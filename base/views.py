from django.shortcuts import render
from .models import Item, Category
from django.core.exceptions import ObjectDoesNotExist
from django.core.paginator import Paginator


# Create your views here.


def catalog(req, args):
    slugs = list(filter(lambda elm: elm != '', args.split('/')))
    items = [] if not slugs else Item.objects.filter(category__slug=slugs[-1])
    paginator = Paginator(items, 12)
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

    context = {'categories': categories, 'breadcrumbs': breadcrumbs, 'items': items, 'page_obj': page_obj}
    return render(req, 'main.html', context)
