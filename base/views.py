from django.shortcuts import render
from .models import Item

# Create your views here.


def catalog(req):
    items = Item.objects.all()
    context = {'items': items}
    return render(req, 'catalog.html', context)

def firstLevel(req, pk):
    # items = Item.objects.all()
    # context = {'items': items}
    return render(req, 'catalog.html')

def secondLevel(req,user):
    return render(req, 'catalog.html')

