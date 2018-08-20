import datetime

from django.utils import timezone
from django.contrib.auth import get_user_model

from rest_framework_jwt.settings import api_settings
from rest_framework import serializers

from pygym.email_utils import send_mail


jwt_payload_handler = api_settings.JWT_PAYLOAD_HANDLER
jwt_encode_handler = api_settings.JWT_ENCODE_HANDLER
jwt_response_payload_handler = api_settings.JWT_RESPONSE_PAYLOAD_HANDLER

expire_delta = api_settings.JWT_REFRESH_EXPIRATION_DELTA
User = get_user_model()


class UserPublicSerializer(serializers.ModelSerializer):
    """
    Serializer to handle User Public Info
    """
    class Meta:
        model = User
        fields = [
            'id',
            'first_name',
            'last_name',
            'email'
        ]


class UserSerializer(serializers.ModelSerializer):
    """
    Serializer to handle Users
    """
    email = serializers.CharField(write_only=True)
    first_name = serializers.CharField(write_only=True, allow_blank=False)
    last_name = serializers.CharField(write_only=True, allow_blank=False)
    password = serializers.CharField(style={'input_type': 'password'}, write_only=True)
    password2 = serializers.CharField(style={'input_type': 'password'}, write_only=True)
    token = serializers.SerializerMethodField(read_only=True)
    expires = serializers.SerializerMethodField(read_only=True)
    message = serializers.SerializerMethodField(read_only=True)

    class Meta:
        model = User
        fields = [
            'email',
            'first_name',
            'last_name',
            'password',
            'password2',
            'token',
            'expires',
            'message'
        ]

    def get_message(self, obj):
        return "Thank you for be with us on VirtuaGym"

    def get_expires(self, obj):
        return timezone.now() + expire_delta - datetime.timedelta(seconds=200)

    def validate_email(self, value):
        qs = User.objects.filter(email__iexact=value)
        if qs.exists():
            raise serializers.ValidationError('User with this email already exists')
        return value

    def validate_username(self, value):
        qs = User.objects.filter(username__iexact=value)
        if qs.exists():
            raise serializers.ValidationError('User with this username already exists')
        return value

    def get_token(self, obj):
        user = obj
        payload = jwt_payload_handler(user)
        token = jwt_encode_handler(payload)
        return token

    def create(self, validate_data):
        """
        Create the user account
        and send the email
        """
        user_obj = User(username=validate_data.get('email'), email=validate_data.get('email'), first_name=validate_data.get('first_name'), last_name=validate_data.get('last_name'))
        user_obj.set_password(validate_data.get('password'))
        user_obj.is_active = True # In a real scenario we would put True here only after email confirmation
        user_obj.save()
        """
        The best option here would be create a task on Celery + Redis or another task app + 
        message broker to send all the emails later...
        """
        send_mail("Email confinformation VirtuaGym", "Please, click in the link bellow to confirm your email and activate your account...", user_obj.email)
        return user_obj
