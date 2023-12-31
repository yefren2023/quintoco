# Generated by Django 4.0.2 on 2023-07-28 21:36

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('portfolio', '0023_schedule_delete_availableschedule'),
    ]

    operations = [
        migrations.AlterField(
            model_name='statistic',
            name='field_four',
            field=models.CharField(blank=True, default='Award Won', max_length=50, null=True, verbose_name='Name of Field Four'),
        ),
        migrations.AlterField(
            model_name='statistic',
            name='field_one',
            field=models.CharField(blank=True, default='Total Case', max_length=50, null=True, verbose_name='Name of Field One'),
        ),
        migrations.AlterField(
            model_name='statistic',
            name='field_three',
            field=models.CharField(blank=True, default='Successful', max_length=50, null=True, verbose_name='Name of Field Three'),
        ),
        migrations.AlterField(
            model_name='statistic',
            name='field_two',
            field=models.CharField(blank=True, default='Active Case', max_length=50, null=True, verbose_name='Name of Field Two'),
        ),
        migrations.AlterField(
            model_name='userprofile',
            name='name',
            field=models.CharField(blank=True, max_length=40, null=True),
        ),
    ]
