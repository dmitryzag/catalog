from django.urls import path, re_path
from . import views

urlpatterns = [
    re_path(r'search/', views.search, name='search'),
    re_path(r'^(?P<args>[\w+/]*)$', views.catalog, name='catalog'),
]
