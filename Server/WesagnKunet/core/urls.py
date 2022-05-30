from rest_framework.routers import SimpleRouter


from .viewsets import MarriageCertificateViewSet, DeathCertificateViewSet, BirthCertificateViewSet

router = SimpleRouter()

router = SimpleRouter()

router.register("birth", BirthCertificateViewSet, basename="birth")
router.register("marriage", MarriageCertificateViewSet, basename="marriage")
router.register('death', DeathCertificateViewSet, basename='death')


urlpatterns = router.urls

