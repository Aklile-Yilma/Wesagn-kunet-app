from rest_framework.routers import SimpleRouter


from .viewsets import MarriageCertificateViewSet, DeathCertificateViewSet

router = SimpleRouter()


router.register("marriage", MarriageCertificateViewSet, basename="marriage")
router.register('death', DeathCertificateViewSet, basename='death')



urlpatterns = router.urls

