from rest_framework.routers import SimpleRouter


from .viewsets import MarriageCertificateViewSet

router = SimpleRouter()

router.register("marriage", MarriageCertificateViewSet, basename="marriage")



urlpatterns = router.urls

