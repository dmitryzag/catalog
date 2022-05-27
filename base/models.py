from django.db import models


class Item(models.Model):
    desc = models.CharField(max_length=200)
    image = models.ImageField(upload_to='items/', null=True, blank=True)
    category = models.ForeignKey('Category', related_name='items', on_delete=models.CASCADE, null=True, blank=True)


class Category(models.Model):
    name = models.TextField()
    slug = models.SlugField()
    image = models.ImageField(upload_to='media', null=True, blank=True)
    parent = models.ForeignKey('Category', related_name='child', on_delete=models.CASCADE, null=True, blank=True)
