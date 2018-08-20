from django.contrib.auth import get_user_model
from django.db.models import Q
from django.shortcuts import get_object_or_404

from rest_framework.viewsets import ModelViewSet
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework_jwt.settings import api_settings
from rest_framework import permissions


from .permissions import AnonPermissionOnly
from .serializers import UserSerializer, UserPublicSerializer

jwt_payload_handler = api_settings.JWT_PAYLOAD_HANDLER
jwt_encode_handler = api_settings.JWT_ENCODE_HANDLER
jwt_response_payload_handler = api_settings.JWT_RESPONSE_PAYLOAD_HANDLER
User = get_user_model()


class AuthAPIView(APIView):
    """
    View to user login
    """
    permission_classes = [AnonPermissionOnly]

    def post(self, request, *args, **kwarg):
        if request.user.is_authenticated:
            return Response({'detail': 'You are already authenticated'}, status=400)
        data = request.data
        username = data.get('username')  # username or email
        password = data.get('password')
        qs = User.objects.filter(
            Q(username__iexact=username) |
            Q(email__iexact=username)
        ).distinct()
        if qs.count() == 1:
            user_obj = qs.first()
            if user_obj.check_password(password):
                user = user_obj
                payload = jwt_payload_handler(user)
                token = jwt_encode_handler(payload)
                response = jwt_response_payload_handler(token, user, request=request)
                return Response(response)
        return Response({'detail': 'Invalid credentials'}, status=401)


class RegisterAPIView(ModelViewSet):
    """
    ViewSet to user register, update and delete
    """
    queryset = User.objects.all()
    serializer_class = UserSerializer

    def get_permissions(self):
        if self.action == 'create':
            permission_classes = [AnonPermissionOnly, permissions.AllowAny]
        else:
            permission_classes = self.permission_classes
        return [permission() for permission in permission_classes]

    def get_serializer_class(self):
        if self.request.method == 'GET':
            return UserPublicSerializer
        return UserSerializer

    def update(self, request, *args, **kwargs):
        if not request.data or not self.kwargs['pk']:
            return Response({'message': 'Nothing to update'}, 403)

        user = get_object_or_404(User, pk=self.kwargs['pk'])

        if 'first_name' in request.data:
            user.first_name = request.data['first_name']
        if 'last_name' in request.data:
            user.last_name = request.data['last_name']
        if 'email' in request.data:
            user.email = request.data['email']
        if 'password' in request.data:
            if 'password2' in request.data and request.data['password'] == request.data['password2']:
                user.set_password(request.data['password'])
            else:
                return Response({'message': 'The password must match'}, 403)
        user.save()
        serializer = UserPublicSerializer(user)
        return Response(serializer.data, 200)
