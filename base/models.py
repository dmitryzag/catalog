from django.db import models


# Create your models here.

class Item(models.Model):
    desc = models.CharField(max_length=200)
    image = models.ImageField(upload_to='media/')
    slug = models.SlugField()
    category = models.ForeignKey('self', related_name='items', on_delete=models.CASCADE, null=True, blank=True)

    def __str__(self):
        return self.desc
