from django.contrib import admin


from .models import MarriageCertificate, CertificateDetails, Country, Address

admin.site.register(CertificateDetails)
admin.site.register(MarriageCertificate.Spouse)
admin.site.register(MarriageCertificate)
admin.site.register(Address)
admin.site.register(Country)
