"""
Django settings for WesagnKunet project.

Generated by 'django-admin startproject' using Django 3.0.

For more information on this file, see
https://docs.djangoproject.com/en/3.0/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/3.0/ref/settings/
"""

import os

# Build paths inside the project like this: os.path.join(BASE_DIR, ...)
BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))


# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/3.0/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = '*+!anj_nn0035@+m-qb$h(hk50j=ph2x&(+5i_wtwzm_)r1cm3'

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

ALLOWED_HOSTS = []


# Application definition

INSTALLED_APPS = [
		'django.contrib.admin',
		'django.contrib.auth',
		'django.contrib.contenttypes',
		'django.contrib.sessions',
		'django.contrib.messages',
		'django.contrib.staticfiles',

		'django.contrib.sites',

		# 3rd party
		'rest_framework',
		'rest_framework.authtoken',
		'rest_auth',

		'allauth',
		'allauth.account',
		'rest_auth.registration',

		# Local 
		'accounts.apps.AccountsConfig',
		"core"
		]

SITE_ID = 1


REST_FRAMEWORK = { 'DEFAULT_PERMISSION_CLASSES': [
	'rest_framework.permissions.AllowAny',
	],
	'DEFAULT_AUTHENTICATION_CLASSES': [
		'rest_framework.authentication.SessionAuthentication', 
		'rest_framework.authentication.TokenAuthentication', 
		],
	# 'USER_DETAILS_SERIALIZER': 'users.serializers.UserDetailsSerializer',
	}
AUTHENTICATION_BACKENDS = [
		'django.contrib.auth.backends.ModelBackend'
		]

MIDDLEWARE = [
		'django.middleware.security.SecurityMiddleware',
		'django.contrib.sessions.middleware.SessionMiddleware',
		'django.middleware.common.CommonMiddleware',
		'django.middleware.csrf.CsrfViewMiddleware',
		'django.contrib.auth.middleware.AuthenticationMiddleware',
		'django.contrib.messages.middleware.MessageMiddleware',
		'django.middleware.clickjacking.XFrameOptionsMiddleware',
		]

ROOT_URLCONF = 'WesagnKunet.urls'

TEMPLATES = [
		{
			'BACKEND': 'django.template.backends.django.DjangoTemplates',
			'DIRS': [],
			'APP_DIRS': True,
			'OPTIONS': {
				'context_processors': [
					'django.template.context_processors.debug',
					'django.template.context_processors.request',
					'django.contrib.auth.context_processors.auth',
					'django.contrib.messages.context_processors.messages',
					],
				},
			},
		]

WSGI_APPLICATION = 'WesagnKunet.wsgi.application'


# Database
# https://docs.djangoproject.com/en/3.0/ref/settings/#databases

DATABASES = {

		'default': {
			'ENGINE': 'django.db.backends.postgresql',
			'NAME': 'wesagn_kunet_db',
			'USER': 'postgres',
			'PASSWORD': '1234', # NOT RECOMMENDED BUT JUST FOR THIS ASSIGNMENT
			'HOST': "localhost",
			'PORT': "5432"
			}

		}


# Password validation
# https://docs.djangoproject.com/en/3.0/ref/settings/#auth-password-validators

AUTH_PASSWORD_VALIDATORS = [
		{
			'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
			},
		{
			'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
			},
		{
			'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
			},
		{
			'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
			},
		]


# Internationalization
# https://docs.djangoproject.com/en/3.0/topics/i18n/

LANGUAGE_CODE = 'en-us'

TIME_ZONE = 'UTC'

USE_I18N = True

USE_L10N = True

USE_TZ = True


# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/3.0/howto/static-files/
ACCOUNT_EMAIL_REQUIRED=True

STATIC_URL = '/static/'
DEFAULT_AUTO_FIELD = 'django.db.models.BigAutoField'

AUTH_USER_MODEL='accounts.CustomeUser'


MEDIA_URL = "/media/"
MEDIA_ROOT = "uploads"
