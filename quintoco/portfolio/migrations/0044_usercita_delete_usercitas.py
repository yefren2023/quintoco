# Generated by Django 4.0.2 on 2023-08-31 16:11

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('portfolio', '0043_usercitas_delete_usercita'),
    ]

    operations = [
        migrations.CreateModel(
            name='UserCita',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('timestamp', models.DateTimeField(auto_now_add=True)),
                ('name', models.CharField(max_length=100, verbose_name='Nombres y Apellidos')),
                ('email', models.EmailField(max_length=254, verbose_name='Email')),
                ('phone', models.CharField(max_length=100, verbose_name='Celular')),
                ('fecha_cita', models.DateTimeField(verbose_name='Fecha cita')),
                ('time', models.CharField(max_length=50, verbose_name='Hora cita')),
                ('message', models.TextField(verbose_name='Mensaje')),
            ],
            options={
                'verbose_name': 'Información de Contactos con Solicitud de citas',
                'verbose_name_plural': 'Información de Contactos con Solicitud de citas',
                'ordering': ['timestamp'],
            },
        ),
        migrations.DeleteModel(
            name='UserCitas',
        ),
    ]
