# Generated by Django 4.0.2 on 2023-08-11 22:28

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('portfolio', '0037_politica'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='areas',
            name='class_name_imagen',
        ),
        migrations.AddField(
            model_name='areas',
            name='image_principal',
            field=models.ImageField(blank=True, null=True, upload_to='areas_images', verbose_name='Subir Imagen Principal'),
        ),
        migrations.AddField(
            model_name='politica',
            name='is_active',
            field=models.BooleanField(default=True),
        ),
        migrations.AlterField(
            model_name='areas',
            name='image',
            field=models.ImageField(blank=True, null=True, upload_to='areas_images', verbose_name='Subir Imagen inicial'),
        ),
    ]
