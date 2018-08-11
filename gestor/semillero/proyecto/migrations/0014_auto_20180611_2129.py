# Generated by Django 2.0.6 on 2018-06-11 21:29

from django.db import migrations, models
import tinymce.models


class Migration(migrations.Migration):

    dependencies = [
        ('proyecto', '0013_auto_20180611_1951'),
    ]

    operations = [
        migrations.AddField(
            model_name='proyecto',
            name='descripcion',
            field=tinymce.models.HTMLField(blank=True, null=True, verbose_name='Descripción'),
        ),
        migrations.AlterField(
            model_name='influencia',
            name='name',
            field=models.CharField(max_length=120, verbose_name='Nombre de la influencia'),
        ),
    ]