# Generated by Django 4.0.4 on 2022-04-25 08:43

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('base', '0008_remove_processor_image'),
    ]

    operations = [
        migrations.AddField(
            model_name='processor',
            name='image',
            field=models.ImageField(null=True, upload_to=None),
        ),
    ]