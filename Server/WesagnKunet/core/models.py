from django.db import models

from accounts.models import Client


class CertificateDetails(models.Model):


	users = models.ManyToManyField(Client)

	issue_date = models.DateField(null=True, default=None)

	application_date = models.DateField(auto_now_add=True)



class Country(models.Model):

	name = models.CharField(max_length=128)

	def __str__(self) -> str:
		return self.name



class Address(models.Model):

	# country = models.CharField(Country, on_delete=models.CASCADE)
	
	country = models.CharField(max_length=128)
	city = models.CharField(max_length=128)
	subcity= models.CharField(max_length=128)
	wereda= models.IntegerField()
	house_number= models.IntegerField(blank=True)

	def __str__(self) -> str:
		return "%s, %s, %s" % (self.subcity, self.city, self.country)
	

class MarriageCertificate(models.Model):

	class Spouse(models.Model):
		
		first_name = models.CharField(max_length=128)
		middle_name = models.CharField(max_length=128)
		last_name = models.CharField(max_length=128)

		def __str__(self) -> str:
			return "%s %s %s" % (self.first_name, self.middle_name, self.last_name)


	detail = models.ForeignKey(CertificateDetails, on_delete=models.CASCADE)

	wife = models.ForeignKey(Spouse,related_name="wife", on_delete=models.CASCADE)

	husband = models.ForeignKey(Spouse, related_name="husband", on_delete=models.CASCADE)

	marriage_date = models.DateField()

	verified = models.BooleanField(default=False)


