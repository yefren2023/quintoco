# Generated by Django 4.0.2 on 2023-08-07 16:46

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('portfolio', '0029_quienes_somo_alter_areas_area_alter_areas_image'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='quienes_somo',
            name='descriccion',
        ),
        migrations.AddField(
            model_name='quienes_somo',
            name='parrafo1',
            field=models.CharField(blank=True, max_length=1000, null=True, verbose_name='Escribe primer parrafo'),
        ),
        migrations.AddField(
            model_name='quienes_somo',
            name='parrafo2',
            field=models.CharField(blank=True, max_length=1000, null=True, verbose_name='Escribe segundo parrafo'),
        ),
        migrations.AddField(
            model_name='quienes_somo',
            name='parrafo3',
            field=models.CharField(blank=True, max_length=1000, null=True, verbose_name='Escribe tercer parrafo'),
        ),
    ]
