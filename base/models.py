from django.db import models
from django.urls import reverse


# Create your models here.

class Item(models.Model):
    desc = models.CharField(max_length=200)
    image = models.ImageField(upload_to='items/')
    slug = models.SlugField()
    category = models.ForeignKey('Category', related_name='items', on_delete=models.CASCADE, null=True, blank=True)

    def __str__(self):
        return self.desc


class Category(models.Model):
    name = models.TextField()
    slug = models.SlugField()
    image = models.ImageField(upload_to='media')
    parent = models.ForeignKey('Category', related_name='child', on_delete=models.CASCADE, null=True, blank=True)

    def get_absolute_url(self):
        sl = [self.slug]
        parent = self.parent
        while parent:
            sl.append(parent.slug)
            parent = parent.parent

        return "/{0}/".format('/'.join(sl[::-1]))

    def __str__(self):
        return self.name
