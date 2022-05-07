"""WesagnKunet URL Configuration"""
from django.contrib import admin
from django.urls import path, include

urlpatterns = [
    path('api/v1/admin/', admin.site.urls),
    path('api-auth/', include('rest_framework.urls')),
    
    path('api/v1/auth/', include('rest_auth.urls')),
    path('api/v1/auth/signup/', include('rest_auth.registration.urls')),
    path('api/v1/', include('accounts.urls')),
]
