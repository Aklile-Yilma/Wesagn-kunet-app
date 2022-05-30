

from django.utils import timezone
from rest_framework import serializers
from allauth.account.adapter import get_adapter
from WesagnKunet import settings
from .models import Client
from allauth.account.utils import setup_user_email
from django.contrib.auth import get_user_model



class RegisterSerializer(serializers.Serializer):
    email = serializers.EmailField(required=settings.ACCOUNT_EMAIL_REQUIRED)
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
    photo=serializers.ImageField(required=False, write_only=False)


    password = serializers.CharField(required=True, write_only=True)
   

    def validate_password(self, password):
        return get_adapter().clean_password(password)

    def custom_signup(self, request, user):
        pass

    def get_cleaned_data(self):
        return {
            'first_name': self.validated_data.get('first_name', ''),
            'middle_name': self.validated_data.get('middle_name', ''),
            'last_name': self.validated_data.get('last_name', ''),
            'date_of_birth':self.validated_data.get('date_of_birth', '') ,
            'sex':self.validated_data.get('sex', '') ,
            'blood_type': self.validated_data.get('blood_type', ''),
            'city':self.validated_data.get('city', '') ,
            'country': self.validated_data.get('country', ''),
            'nationality':self.validated_data.get('nationality', '') ,
            'phone_number':self.validated_data.get('phone_number', '') ,
            'photo': self.validated_data.get('photo', ''),

            
            'password': self.validated_data.get('password', ''),
            'email': self.validated_data.get('email', ''),
        }

    def save(self, request):
        adapter = get_adapter()
        user = adapter.new_user(request)
        self.cleaned_data = self.get_cleaned_data()
        adapter.save_user(request, user, self)
        self.custom_signup(request, user)
        setup_user_email(request, user, [])
        

        user.save()
        return user

class UserDetailsSerializer(serializers.ModelSerializer):
    class Meta:
        model=get_user_model()
        fields=('pk', 'username', 'email', 'is_admin', 'is_staff',)
        read_only_fields=('email',)


class ClientSerializer(serializers.ModelSerializer):
    class Meta:
        model=Client
        fields=('pk', 'user', 'first_name', 'middle_name', 'last_name', 'sex', 'date_of_birth', 'blood_type', 'city', 'country', 'nationality', 'phone_number', 'photo')