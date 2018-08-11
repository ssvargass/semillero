# Generated by Django 2.0.6 on 2018-07-17 20:53

from django.db import migrations
import django_fsm


class Migration(migrations.Migration):

    dependencies = [
        ('proyecto', '0034_auto_20180717_0405'),
    ]

    operations = [
        migrations.AlterField(
            model_name='proyecto',
            name='state',
            field=django_fsm.FSMField(choices=[('borrador', 'borrador'), ('publicado', 'publicado')], default='borrador', max_length=50, protected=True, verbose_name='Publication State'),
        ),
    ]
