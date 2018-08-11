# Generated by Django 2.0.6 on 2018-06-11 00:24

from django.db import migrations
import django_fsm


class Migration(migrations.Migration):

    dependencies = [
        ('proyecto', '0006_remove_proyecto_state'),
    ]

    operations = [
        migrations.AddField(
            model_name='proyecto',
            name='state',
            field=django_fsm.FSMField(choices=[('borrador', 'borrador'), ('revisado', 'revisado'), ('publicado', 'publicado'), ('deleted', 'deleted')], default='borrador', max_length=50, protected=True, verbose_name='Publication State'),
        ),
    ]