# Generated by Django 2.0.6 on 2018-06-17 19:19

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('proyecto', '0023_proyecto_comentario'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='proyecto',
            name='comentario',
        ),
    ]
