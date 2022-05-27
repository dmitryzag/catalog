from django.db import models


class Item(models.Model):
    desc = models.CharField(max_length=200)
    image = models.ImageField(upload_to='items/', null=True, blank=True)
    category = models.ForeignKey('Category', related_name='items', on_delete=models.CASCADE, null=True, blank=True)

    def get_absolute_url(self):
        return '{0}{1}/'.format(self.category.get_absolute_url(), self.slug)

    def try_image(self):
        if self.image:
            return self.image
        return self.category.try_image()

    def __str__(self):
        return self.desc


class Category(models.Model):
    name = models.TextField()
    slug = models.SlugField()
    image = models.ImageField(upload_to='media', null=True, blank=True)
    parent = models.ForeignKey('Category', related_name='child', on_delete=models.CASCADE, null=True, blank=True)

    def get_absolute_url(self):
        sl = [self.slug]
        parent = self.parent
        while parent:
            sl.append(parent.slug)
            parent = parent.parent
        return '/{0}/'.format('/'.join(sl[::-1]))

    def try_image(self):
        if not self.image:
            return self.parent.try_image()
        return self.image

    def __str__(self):
        return self.name



