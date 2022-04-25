from django.db import models


# Create your models here.

class Prefix(models.Model):
    name = models.CharField(max_length=200)

    def __str__(self):
        return self.name


class Micro(models.Model):
    name = models.CharField(max_length=200)

    def __str__(self):
        return self.name


class Processor(models.Model):
    name = models.ForeignKey(Prefix, on_delete=models.CASCADE)
    model = models.ForeignKey(Micro, null=True, blank=True, on_delete=models.CASCADE)
    # image = models.ImageField(upload_to=None, height_field=None, width_field=None, max_length=100, null=True)

    def __str__(self):
        return "{0}".format(self.name.name)
