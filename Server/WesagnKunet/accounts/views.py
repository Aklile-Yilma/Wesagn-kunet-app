


from rest_framework import permissions
from .serializers import UserDetailsSerializer

from django.contrib.auth import get_user_model
from rest_framework import viewsets
from .models import Client
from .serializers import ClientSerializer



class UserViewSet(viewsets.ModelViewSet):
    queryset=get_user_model().objects.all()
    serializer_class=UserDetailsSerializer
    permission_classes=[permissions.IsAdminUser]

class ClientViewSet(viewsets.ModelViewSet):
    queryset=Client.objects.all()
    serializer_class=ClientSerializer
    permission_classes=[permissions.IsAdminUser]
