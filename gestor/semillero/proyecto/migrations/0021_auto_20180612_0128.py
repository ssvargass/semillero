# Generated by Django 2.0.6 on 2018-06-12 01:28

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('proyecto', '0020_auto_20180612_0120'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='proyecto',
            name='documentos',
        ),
        migrations.AddField(
            model_name='proyecto',
            name='documentos',
            field=models.ManyToManyField(blank=True, related_name='documentos', to='proyecto.Documento', verbose_name='Documentos asociados'),
        ),
    ]
