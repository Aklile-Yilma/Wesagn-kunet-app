# Generated by Django 3.0 on 2022-05-30 14:32

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion
import django.utils.timezone


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('auth', '0011_update_proxy_permissions'),
    ]

    operations = [
        migrations.CreateModel(
            name='CustomeUser',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('password', models.CharField(max_length=128, verbose_name='password')),
                ('last_login', models.DateTimeField(blank=True, null=True, verbose_name='last login')),
                ('email', models.EmailField(max_length=255, unique=True, verbose_name='email address')),
                ('username', models.CharField(max_length=255, unique=True, verbose_name='username')),
                ('is_active', models.BooleanField(default=True)),
                ('is_admin', models.BooleanField(default=False)),
                ('is_staff', models.BooleanField(default=False)),
                ('is_superuser', models.BooleanField(default=False)),
                ('groups', models.ManyToManyField(blank=True, help_text='The groups this user belongs to. A user will get all permissions granted to each of their groups.', related_name='user_set', related_query_name='user', to='auth.Group', verbose_name='groups')),
                ('user_permissions', models.ManyToManyField(blank=True, help_text='Specific permissions for this user.', related_name='user_set', related_query_name='user', to='auth.Permission', verbose_name='user permissions')),
            ],
            options={
                'abstract': False,
            },
        ),
        migrations.CreateModel(
            name='Client',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('first_name', models.CharField(max_length=30)),
                ('middle_name', models.CharField(max_length=30)),
                ('last_name', models.CharField(max_length=30)),
                ('date_of_birth', models.DateField(default=django.utils.timezone.now)),
                ('sex', models.CharField(choices=[('MALE', 'MALE'), ('FEMALE', 'FEMALE')], max_length=6)),
                ('blood_type', models.CharField(choices=[('A_PLUS', 'A_PLUS'), ('A_MINUS', 'A_MINUS'), ('B_PLUS', 'B_PLUS'), ('B_MINUS', 'B_MINUS'), ('AB_PLUS', 'AB_PLUS'), ('AB_MINUS', 'AB_MINUS'), ('O_PLUS', 'O_PLUS'), ('O_MINUS', 'O_MINUS')], max_length=9)),
                ('city', models.CharField(max_length=50)),
                ('country', models.CharField(blank=True, max_length=30)),
                ('nationality', models.CharField(blank=True, max_length=30)),
                ('phone_number', models.CharField(blank=True, max_length=15)),
                ('photo', models.ImageField(blank=True, upload_to='uploads')),
                ('user', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
    ]
