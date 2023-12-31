# Generated by Django 4.0.2 on 2023-08-07 19:19

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('portfolio', '0030_remove_quienes_somo_descriccion_and_more'),
    ]

    operations = [
        migrations.CreateModel(
            name='Mision',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('image', models.ImageField(blank=True, null=True, upload_to='quienes_images', verbose_name='Suba imagen para Mision')),
                ('titulo', models.CharField(blank=True, default='Misión', max_length=50, null=True, verbose_name='Escribe un titulo para el Contenido')),
                ('parrafo1', models.CharField(blank=True, max_length=1000, null=True, verbose_name='Escribe la misión')),
                ('is_active', models.BooleanField(default=True)),
            ],
            options={
                'verbose_name': 'Misiones',
                'verbose_name_plural': 'Mision',
            },
        ),
        migrations.CreateModel(
            name='Vision',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('image', models.ImageField(blank=True, null=True, upload_to='quienes_images', verbose_name='Suba imagen para Vision')),
                ('titulo', models.CharField(blank=True, default='Visión', max_length=50, null=True, verbose_name='Escribe un titulo para el Contenido')),
                ('parrafo1', models.CharField(blank=True, max_length=1000, null=True, verbose_name='Escribe la Visión')),
                ('is_active', models.BooleanField(default=True)),
            ],
            options={
                'verbose_name': 'Visiones',
                'verbose_name_plural': 'Vision',
            },
        ),
    ]
