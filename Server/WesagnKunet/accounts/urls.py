from django.urls import path
from rest_framework.routers import SimpleRouter
from .views import UserViewSet, ClientViewSet, SignupView, MyAccountView

router=SimpleRouter()

router.register('users', UserViewSet, basename='users')
router.register('clients',ClientViewSet, basename='clients')

urlpatterns=router.urls


urlpatterns += [
        path('auth/signup', SignupView.as_view()),
        path('auth/my-account', MyAccountView.as_view())
]
