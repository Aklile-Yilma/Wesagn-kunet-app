from django.contrib import admin


from .models import MarriageCertificate, CertificateDetails, Country, Address, DeathCertificate

admin.site.register(CertificateDetails)
admin.site.register(MarriageCertificate.Spouse)
admin.site.register(MarriageCertificate)
admin.site.register(Address)
admin.site.register(Country)
admin.site.register(DeathCertificate.DeacesedInfo)
admin.site.register(DeathCertificate)
