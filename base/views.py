from django.shortcuts import render
from .models import Item, Category

# Create your views here.


def catalog(req, args):
    # firstLevel = Category.objects.filter(parent__isnull=True)
    slugs = args.split('/')
    print(Category.objects.all()[8].parent.slug)

    categories = Category.objects.filter(parent__isnull=True)
    breadcrumbs = []
    url = '/'

    for slug in slugs:
        if slug != '':
            url = '{0}{1}/'.format(url, slug)
            name = Category.objects.get(slug=slug)
            breadcrumb = {'slug': slug, 'url': url, 'name': name}
            breadcrumbs.append(breadcrumb)

    context = {'categories': categories, 'breadcrumbs': breadcrumbs}
    return render(req, 'main.html', context)
