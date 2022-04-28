from django.shortcuts import render
from .models import Item, Category

# Create your views here.


def catalog(req, args):
    slugs = args.split('/')
    items = Item.objects.all()
    categories = Category.objects.filter(parent__isnull=True)
    breadcrumbs = []
    url = '/'

    for slug in slugs:
        if slug != '':
            url = '{0}{1}/'.format(url, slug)
            name = Category.objects.get(slug=slug)
            breadcrumb = {'slug': slug, 'url': url, 'name': name}
            breadcrumbs.append(breadcrumb)

    context = {'categories': categories, 'breadcrumbs': breadcrumbs, 'items': items}
    return render(req, 'main.html', context)
