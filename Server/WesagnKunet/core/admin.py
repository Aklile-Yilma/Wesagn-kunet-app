from django.contrib import admin
from .models import MarriageCertificate, CertificateDetails, Country, Address, DeathCertificate, BirthCertificate


admin.site.register(CertificateDetails)
admin.site.register(MarriageCertificate.Spouse)
admin.site.register(MarriageCertificate)
admin.site.register(BirthCertificate)
admin.site.register(BirthCertificate.child)
admin.site.register(BirthCertificate.ParentInformation)
admin.site.register(Address)
admin.site.register(Country)
admin.site.register(DeathCertificate.DeacesedInfo)
admin.site.register(DeathCertificate)
