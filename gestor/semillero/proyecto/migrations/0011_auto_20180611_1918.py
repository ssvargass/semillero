# Generated by Django 2.0.6 on 2018-06-11 19:18

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('proyecto', '0010_auto_20180611_1903'),
    ]

    operations = [
        migrations.CreateModel(
            name='Ambito',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=120, verbose_name='Nombre del ámbito')),
            ],
            options={
                'verbose_name': 'Ámbito',
                'verbose_name_plural': 'Ámbitos',
            },
        ),
        migrations.AddField(
            model_name='proyecto',
            name='ambito',
            field=models.ManyToManyField(blank=True, related_name='ambito', to='proyecto.Ambito', verbose_name='Ámbito'),
        ),
    ]
