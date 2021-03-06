# Generated by Django 2.0.6 on 2018-06-11 19:39

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('proyecto', '0011_auto_20180611_1918'),
    ]

    operations = [
        migrations.CreateModel(
            name='Orientacion',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=120, verbose_name='Nombre de la orientación')),
            ],
            options={
                'verbose_name': 'Orientación',
                'verbose_name_plural': 'Orientaciones',
            },
        ),
        migrations.AddField(
            model_name='proyecto',
            name='orientacion',
            field=models.ManyToManyField(blank=True, related_name='orientacion', to='proyecto.Orientacion', verbose_name='Orientación'),
        ),
    ]
