
from rest_framework import permissions
from .serializers import UserDetailsSerializer, ClientSerializer, RegisterSerializer
from rest_framework.response import Response
from django.contrib.auth import get_user_model
from rest_framework import viewsets
from .models import Client, CustomeUser
from rest_framework import generics, status
from rest_framework.response import Response




class UserViewSet(viewsets.ModelViewSet):
    queryset=get_user_model().objects.all()
    serializer_class=UserDetailsSerializer
    permission_classes=[permissions.IsAdminUser]

# class SignupViewSet(viewsets.ModelViewSet):
#     serializer_class= RegisterSerializer
#     permission_classes=[permissions.AllowAny]

#     def post(self, request):
#         data=request.data
#         serializer=self.serializer_class(data=data)
#         if serializer.is_valid(raise_exception=True):
#             print(serializer)
#             serializer.save(request)
#             return Response(data=serializer.data, status=status.HTTP_201_CREATED)
#         return Response(data=serializer.error_messages, status=status.HTTP_400_BAD_REQUEST)

class ClientViewSet(viewsets.ModelViewSet):
    queryset=Client.objects.all()
    serializer_class=ClientSerializer
    permission_classes=[permissions.IsAdminUser]



