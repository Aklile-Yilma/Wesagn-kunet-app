
from rest_framework import permissions
from .serializers import UserDetailsSerializer, ClientSerializer, RegisterSerializer
from rest_framework.response import Response
from django.contrib.auth import get_user_model
from rest_framework import viewsets
from rest_framework.views import APIView
from rest_framework.authtoken.models import Token

from .models import Client, CustomeUser
from rest_framework import generics, status
from rest_framework.response import Response




class UserViewSet(viewsets.ModelViewSet):
	queryset=get_user_model().objects.all()
	serializer_class=UserDetailsSerializer
	permission_classes=[permissions.IsAdminUser]


class SignupView(APIView):

	def post(self, request):
		serializer = RegisterSerializer(data=request.data)
		serializer.is_valid(raise_exception=True)
		client = serializer.save()
		
		return Response(
					{
						"token": Token.objects.get_or_create(user=client.user)[0].key,
						"client": ClientSerializer(client).data
					},
					status=status.HTTP_201_CREATED
				)

		return Response(data=serializer.data, status=status.HTTP_201_CREATED)


class ClientViewSet(viewsets.ModelViewSet):
	queryset=Client.objects.all()
	serializer_class=ClientSerializer
	permission_classes=[permissions.IsAdminUser]





