# Generated by Django 4.0.4 on 2022-04-25 08:40

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('base', '0006_rename_model_processor_modelee'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='processor',
            name='modelee',
        ),
    ]