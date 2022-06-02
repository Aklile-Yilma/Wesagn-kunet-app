from enum import unique

from allauth.account import app_settings as allauth_settings 
from allauth.utils import email_address_exists
from  allauth.account.adapter import get_adapter
from  allauth.account.utils import setup_user_email

from django.utils import timezone
from rest_framework import serializers
from allauth.account.adapter import get_adapter
from WesagnKunet import settings
from .models import Client, CustomeUser
from allauth.account.utils import setup_user_email
from django.contrib.auth import get_user_model



class RegisterSerializer(serializers.Serializer): 
	username=serializers.CharField(required=True)
	email = serializers.EmailField(required=allauth_settings.EMAIL_REQUIRED)
	first_name = serializers.CharField(required=False, write_only=False)
	middle_name=serializers.CharField(required=False, write_only=False)
	last_name = serializers.CharField(required=False, write_only=False)
	date_of_birth=serializers.DateField(default=timezone.now(), required=False, write_only=False)
	sex=serializers.CharField(required=False, write_only=False)
	blood_type=serializers.CharField(required=False, write_only=False)
	city = serializers.CharField(required=False, write_only=False)
	country=serializers.CharField(required=False, write_only=False)
	nationality=serializers.CharField(required=False,write_only=False)
	phone_number=serializers.CharField(required=False, write_only=False)

	password = serializers.CharField(required=True, write_only=True)
	
	def validate_email(self, email):
		email=get_adapter().clean_email(email)
		if allauth_settings.UNIQUE_EMAIL:
			if email and email_address_exists(email):
				raise serializers.ValidationError('Email already exists')
		return email
   

	def create(self, cleaned_data):
		user = CustomeUser.objects.create_user(
				username=cleaned_data.get("username"),
				email=cleaned_data.get("email"),
				password=cleaned_data.get("password")
			)
		client = Client(
				user=user,
				first_name=cleaned_data.get("first_name"),
				middle_name=cleaned_data.get("middle_name"),
				last_name=cleaned_data.get("last_name"),
				date_of_birth=cleaned_data.get("date_of_birth"),
				sex=cleaned_data.get("sex"),
				blood_type=cleaned_data.get("blood_type"),
				city=cleaned_data.get("city"),
				country=cleaned_data.get("country"),
				nationality=cleaned_data.get("nationality"),
				phone_number=cleaned_data.get("phone_number"),
			)
		client.save()
		return client

		

class UserDetailsSerializer(serializers.ModelSerializer):
	class Meta:
		model=get_user_model()
		fields=('pk', 'username', 'email')
		read_only_fields=('email',)


class ClientSerializer(serializers.ModelSerializer):

	user = UserDetailsSerializer()

	class Meta:
		model=Client
		fields=('pk', 'user', 'first_name', 'middle_name', 'last_name', 'sex', 'date_of_birth', 'blood_type', 'city', 'country', 'nationality', 'phone_number')
