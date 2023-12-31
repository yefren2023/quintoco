# Generated by Django 4.0.2 on 2023-08-06 13:22

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('portfolio', '0028_areas_image_alter_areas_definicion_and_more'),
    ]

    operations = [
        migrations.CreateModel(
            name='Quienes_Somo',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('image', models.ImageField(blank=True, null=True, upload_to='quienes_images', verbose_name='Suba imagen a la seccion Quienes somos')),
                ('titulo', models.CharField(blank=True, default='Somos tu mejor Opción', max_length=50, null=True, verbose_name='Escribe un titulo para el Contenido')),
                ('descriccion', models.CharField(blank=True, max_length=500, null=True, verbose_name='Escribe una descripcion')),
                ('is_active', models.BooleanField(default=True)),
            ],
            options={
                'verbose_name': 'Quienes_Somo',
                'verbose_name_plural': 'Quienes_Somos',
            },
        ),
        migrations.AlterField(
            model_name='areas',
            name='area',
            field=models.CharField(blank=True, max_length=100, null=True, verbose_name='Escribe una Area'),
        ),
        migrations.AlterField(
            model_name='areas',
            name='image',
            field=models.ImageField(blank=True, null=True, upload_to='areas_images', verbose_name='Subir Imagen del Area'),
        ),
    ]
