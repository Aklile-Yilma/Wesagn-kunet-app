from typing import *

from django.shortcuts import get_object_or_404
from django.core.exceptions import PermissionDenied

from rest_framework import viewsets
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response

from .serializers import MarriageCertificateSerializer, DeathCertificateSerializer, BirthCertificateSerializer
from .models import BirthCertificate, MarriageCertificate, CertificateDetails, DeathCertificate



class CertificateViewSet:

	def _is_authenticated(self, certificate, request) -> bool:

		return (
					certificate.verified and 
					request.user in [client.user for client in certificate.detail.users.all()]
				) or \
					request.user.is_admin
	
	def _filter(self, queryset: List, request):
		return [certificate for certificate in queryset if self._is_authenticated(certificate, request)]


class MarriageCertificateViewSet(viewsets.ViewSet, CertificateViewSet):

	permission_classes = (IsAuthenticated, )

	def list(self, request):
		queryset = self._filter(MarriageCertificate.objects.all(), request)
		serializer = MarriageCertificateSerializer(queryset, many=True)
		return Response(serializer.data)
	
	def retrieve(self, request, pk=None):
		instance = get_object_or_404(MarriageCertificate, pk=pk)
		if not self._is_authenticated(instance, request):
			raise PermissionDenied()
		serializer = MarriageCertificateSerializer(instance, many=False)
		return Response(serializer.data)
	
	def create(self, request):
		print(request.data)
		serializer = MarriageCertificateSerializer(data=request.data, context={"user": request.user})
		serializer.is_valid(raise_exception=True)
		instance = serializer.save()
		return Response(MarriageCertificateSerializer(instance).data)
	
	def partial_update(self, request, pk=None):
		if not request.user.is_admin:
			raise PermissionDenied()
		instance = get_object_or_404(MarriageCertificate, pk=pk)
		instance.verified = request.data.get("verified")
		instance.save()
		return Response(MarriageCertificateSerializer(instance).data)
	
	def delete(self, request, pk=None):
		instance = get_object_or_404(MarriageCertificate, pk=pk)
		if not self._is_authenticated(instance, request):
			raise PermissionDenied()
		instance.delete()
		
		return Response()

class DeathCertificateViewSet(viewsets.ViewSet, CertificateViewSet):

	permission_classes=(IsAuthenticated,)
	

	def list(self, request):
		queryset=self._filter(DeathCertificate.objects.all(), request)
		serializer=DeathCertificateSerializer(queryset, many=True)

		return Response(serializer.data)

	
	def retrieve(self, request, pk=None):
		instance=get_object_or_404(DeathCertificate, pk=pk)
		if not self._is_authenticated(instance, request):
			raise PermissionDenied()
		serializer=DeathCertificateSerializer(instance, many=False)

		return Response(serializer.data)

	def create(self, request):
		serializer=DeathCertificateSerializer(data=request.data,  context={"user": request.user})
		serializer.is_valid(raise_exception=True)
		instance=serializer.save()

		return Response(DeathCertificateSerializer(instance).data)

	def partial_update(self, request, pk=None):
		if not request.user.is_admin:
			raise PermissionDenied()
		instance=get_object_or_404(DeathCertificate, pk=pk)
		instance.verified=request.data.get('verified')
		instance.save()

		return Response(DeathCertificateSerializer(instance).data)

	def delete(self, request, pk=None):
		instance = get_object_or_404(DeathCertificate, pk=pk)
		if not self._is_authenticated(instance, request):
			raise PermissionDenied()
		instance.delete()
		
		return Response()

class BirthCertificateViewSet(viewsets.ViewSet, CertificateViewSet):

	permission_classes = (IsAuthenticated,)

	def list(self, request):

		queryset = self._filter(BirthCertificate.objects.all(), request)
		serializer = BirthCertificateSerializer(queryset, many=True)
		return Response(serializer.data)

	def retrieve(self, request, pk=None):
		instance = get_object_or_404(BirthCertificate, pk=pk)
		if not self._is_authenticated(instance, request):
			raise PermissionDenied()
		serializer = BirthCertificateSerializer(instance, many=False)
		return Response(serializer.data)

	def create(self, request):
		serializer = BirthCertificateSerializer(data=request.data, context={"user": request.user})
		serializer.is_valid(raise_exception=True)
		instance = serializer.save()
		return Response(BirthCertificateSerializer(instance).data)

	def partial_update(self, request, pk=None):
		if not request.user.is_admin:
			raise PermissionDenied()
		instance=get_object_or_404(BirthCertificate, pk=pk)
		instance.verified=request.data.get('verified')
		instance.save()
		return Response(DeathCertificateSerializer(instance).data)

	def delete(self, request, pk=None):
		instance = get_object_or_404(BirthCertificate, pk=pk)
		if not self._is_authenticated(instance, request):
			raise PermissionDenied()
		instance.delete()
		return Response()

	
	

	

	
	


