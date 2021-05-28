# Generated by Django 3.2 on 2021-05-26 11:37

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('our_areas', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='area',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(default='', max_length=200)),
            ],
        ),
        migrations.RemoveField(
            model_name='city',
            name='district',
        ),
        migrations.AddField(
            model_name='city',
            name='state',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='our_areas.state'),
        ),
        migrations.DeleteModel(
            name='district',
        ),
        migrations.AddField(
            model_name='area',
            name='city',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='our_areas.city'),
        ),
    ]