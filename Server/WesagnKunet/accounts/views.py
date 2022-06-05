
from rest_framework import permissions
from .serializers import UserDetailsSerializer, ClientSerializer, RegisterSerializer
from rest_framework.response import Response
from django.contrib.auth import get_user_model
from django.core.exceptions import PermissionDenied
from rest_framework import viewsets
from rest_framework.views import APIView
from rest_framework_simplejwt.tokens import RefreshToken

from .models import Client, CustomeUser
from rest_framework import generics, status
from rest_framework.response import Response




class UserViewSet(viewsets.ModelViewSet):
	queryset=get_user_model().objects.all()
	serializer_class=UserDetailsSerializer
	permission_classes=[permissions.IsAdminUser]


class SignupView(APIView):

	def __serialize_token(self, token):
		return {
				"refresh": str(token),
				"access": str(token.access_token)
			}

	def post(self, request):
		serializer = RegisterSerializer(data=request.data)
		serializer.is_valid(raise_exception=True)
		client = serializer.save()
		
		return Response(
					{
						"token": self.__serialize_token(RefreshToken.for_user(client.user)),
						"client": ClientSerializer(client).data
					},
					status=status.HTTP_201_CREATED
				)

		return Response(data=serializer.data, status=status.HTTP_201_CREATED)


class ClientViewSet(viewsets.ModelViewSet):
	queryset=Client.objects.all()
	serializer_class=ClientSerializer
	permission_classes=[permissions.IsAdminUser]


class MyAccountView(APIView):

	
	def get(self, request):
		print(request.user)
		if not request.user.is_authenticated:
			raise PermissionDenied()
		
		instance = Client.objects.get(user=request.user)
		return Response(
				ClientSerializer(instance=instance).data
			)


