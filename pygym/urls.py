"""pygym URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include

from django.conf import settings
from django.conf.urls.static import static

from rest_framework import routers
from rest_framework_jwt.views import refresh_jwt_token

from .views import Template404View, Template500View, IndexView
from user.api.viewsets import AuthAPIView, RegisterAPIView
from exercise.api.viewsets import ExerciseViewSet
from plan.api.viewsets import PlanViewSet

router = routers.DefaultRouter()

router.register(r'plans', PlanViewSet, base_name='Plans')
router.register(r'exercises', ExerciseViewSet)
router.register(r'users', RegisterAPIView)

urlpatterns = [
    path(r'admin/', admin.site.urls),
    path(r'api/v1/user/login/', AuthAPIView.as_view(), name='login'),
    path(r'api/v1/token/refresh/', refresh_jwt_token, name='refresh'),
    path(r'api/v1/', include(router.urls)),
    path(r'', IndexView.as_view(), name='index')
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

handler404 = Template404View.as_view()
handler500 = Template500View.as_view()
