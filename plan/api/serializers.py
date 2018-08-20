from rest_framework.serializers import ModelSerializer

from day.api.serializers import DaySerializer
from plan.models import Plan
from user.api.serializers import UserPublicSerializer


class PlanSerializer(ModelSerializer):
    """
    Serializer to handle Plans
    """
    users = UserPublicSerializer(many=True, read_only=True)
    days = DaySerializer(many=True, read_only=True)

    class Meta:
        model = Plan
        fields = [
            'id',
            'name',
            'days',
            'users',
        ]
        read_only_fields = ['id']
