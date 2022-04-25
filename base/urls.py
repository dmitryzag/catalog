from django.contrib import admin
from django.urls import path
from . import views

urlpatterns = [
    path('', views.catalog, name='catalog'),
    path('<str:pk>/', views.firstLevel, name='firstLevel'),
    path('<str:pk>/<str:user>/', views.secondLevel, name='secondLevel'),

]
