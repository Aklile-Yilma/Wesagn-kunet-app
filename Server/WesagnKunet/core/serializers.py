from dataclasses import field
from email.policy import default
from rest_framework import serializers
from traitlets import validate

from accounts.serializers import ClientSerializer
from accounts.models import Client
from .models import MarriageCertificate, CertificateDetails, Address, DeathCertificate


class DetailSerializer(serializers.ModelSerializer):

		users = ClientSerializer(many=True)
		
		class Meta:
			model = CertificateDetails
			fields = "__all__"


class AddressSerializer(serializers.ModelSerializer):

	class Meta:
		model = Address
		fields = "__all__"



class MarriageCertificateSerializer(serializers.ModelSerializer):

	class SpouseSerializer(serializers.ModelSerializer):

		class Meta:
			model = MarriageCertificate.Spouse
			fields = "__all__"


	wife = SpouseSerializer()
	husband = SpouseSerializer()
	detail = DetailSerializer(default=None)
	# address = AddressSerializer()

	def validate_wife(self, wife):
		serializer = MarriageCertificateSerializer.SpouseSerializer(data=wife)
		serializer.is_valid(raise_exception=True)
		return serializer
	
	def validate_husband(self, husband):
		serializer = MarriageCertificateSerializer.SpouseSerializer(data=husband)
		serializer.is_valid(raise_exception=True)
		return serializer

	def create(self, validated_data):

		detail = CertificateDetails()
		detail.save()
		detail.users.set([Client.objects.get(user=self.context["user"])])
		instance = MarriageCertificate(
			wife = validated_data.get("wife").save(),
			husband = validated_data.get("husband").save(),
			detail = detail,
			marriage_date = validated_data["marriage_date"]
		)
		instance.save()
		return instance

	class Meta:
		model = MarriageCertificate
		fields = "__all__"

class DeathCertificateSerializer(serializers.ModelSerializer):
	class DeacesedSerializer(serializers.ModelSerializer):
		class Meta:
			model=DeathCertificate.DeacesedInfo
			fields="__all__"
	deacesed=DeacesedSerializer()
	detail=DetailSerializer(default=None)

	def validate_deacesed(self, deacesed):
		serializer=DeathCertificateSerializer.DeacesedSerializer(data=deacesed)
		serializer.is_valid(raise_exception=True)
		return serializer

	def create(self,validated_data):
		detail=CertificateDetails()
		detail.save()
		detail.users.set([Client.objects.get(user=self.context['user'])])
		instance=DeathCertificate(
			deacesed=validated_data.get('deacesed').save(),
			detail=detail

		)
		instance.save()
		return instance


	class Meta:
		model=DeathCertificate
		fields="__all__"
