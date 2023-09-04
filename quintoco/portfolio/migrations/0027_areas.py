# Generated by Django 4.0.2 on 2023-08-03 02:12

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('portfolio', '0026_alter_choose_description_alter_choose_heading'),
    ]

    operations = [
        migrations.CreateModel(
            name='Areas',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('area', models.CharField(blank=True, max_length=50, null=True, verbose_name='Escribe una Area')),
                ('descriccion', models.CharField(blank=True, max_length=100, null=True, verbose_name='Escribe una Descripción corta')),
                ('definicion', models.CharField(blank=True, max_length=300, null=True, verbose_name='Escribe una Descripción corta')),
                ('class_name', models.CharField(blank=True, default='icon-box-clr-1', max_length=50, null=True, verbose_name='Escribe una clase para asiganr color')),
                ('class_name_imagen', models.CharField(blank=True, default='fas fa-user-friends', max_length=50, null=True, verbose_name='Write a Class Name for Change Icon')),
                ('is_active', models.BooleanField(default=True)),
            ],
            options={
                'verbose_name': 'areas',
                'verbose_name_plural': 'areas',
            },
        ),
    ]
