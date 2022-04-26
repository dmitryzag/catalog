from django.shortcuts import render
from .models import Item

# Create your views here.


def catalog(req):
    items = Item.objects.all()
    context = {'items': items}
    return render(req, 'main.html', context)

# def firstLevel(req, pk):
#     # items = Item.objects.all()
#     # context = {'items': items}
#     return render(req, 'catalog.html')
#
# def secondLevel(req,us):
#     return render(req, 'catalog.html')
#
