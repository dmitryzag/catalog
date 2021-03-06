# Generated by Django 4.0.4 on 2022-04-27 05:25

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('base', '0020_alter_item_category'),
    ]

    operations = [
        migrations.CreateModel(
            name='Category',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.TextField()),
                ('slug', models.SlugField()),
                ('image', models.ImageField(upload_to='media/')),
            ],
        ),
        migrations.RemoveField(
            model_name='processor',
            name='model',
        ),
        migrations.RemoveField(
            model_name='processor',
            name='name',
        ),
        migrations.AlterField(
            model_name='item',
            name='image',
            field=models.ImageField(upload_to='media/'),
        ),
        migrations.DeleteModel(
            name='Micro',
        ),
        migrations.DeleteModel(
            name='Prefix',
        ),
        migrations.DeleteModel(
            name='Processor',
        ),
        migrations.AlterField(
            model_name='item',
            name='category',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='items', to='base.category'),
        ),
    ]
