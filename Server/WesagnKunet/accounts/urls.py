from django.urls import path
from rest_framework.routers import SimpleRouter
from .views import UserViewSet, ClientViewSet

router=SimpleRouter()

router.register('users', UserViewSet, basename='users')
router.register('clients',ClientViewSet, basename='clients')

urlpatterns=router.urls