from django.shortcuts import render
from .models import Item

# Create your views here.


def catalog(req):
    return render(req, 'main.html')


def breadcrumb(req):
    slugs = Item.objects.values('slug')
    context = {'slugs': slugs}
    return render(req, 'base/category.html', context)