# Generated by Django 4.0.4 on 2022-04-25 08:36

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('base', '0003_prefix_processor_model_of_processor_and_more'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='processor',
            name='model_of_processor',
        ),
    ]