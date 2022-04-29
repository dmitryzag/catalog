from django.shortcuts import render
from .models import Item, Category
from django.core.exceptions import ObjectDoesNotExist
# Create your views here.


def catalog(req, args):
    slugs = list(filter(lambda elm: elm != '', args.split('/')))
    items = Item.objects.filter(category__slug=slugs[-1])
    categories = Category.objects.filter(parent__isnull=True)
    breadcrumbs = []
    url = '/'
    # print(item[0].category_id)

    for slug in slugs:
        url = '{0}{1}/'.format(url, slug)
        name = Category.objects.get(slug=slug)
        breadcrumb = {'slug': slug, 'url': url, 'name': name}
        breadcrumbs.append(breadcrumb)
    context = {'categories': categories, 'breadcrumbs': breadcrumbs, 'items': items}
    return render(req, 'main.html', context)
