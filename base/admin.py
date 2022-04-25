from django.contrib import admin
from .models import Processor, Prefix, Micro
# Register your models here.

admin.site.register(Processor)
admin.site.register(Prefix)
admin.site.register(Micro)