from django.shortcuts import render


# Create your views here.

def catalog(req):
    return render(req, 'main.html')
