# Generated by Django 4.0.2 on 2023-07-29 02:30

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('portfolio', '0024_alter_statistic_field_four_alter_statistic_field_one_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='choose',
            name='description',
            field=models.CharField(blank=True, max_length=300, null=True, verbose_name='Write a Description'),
        ),
    ]
