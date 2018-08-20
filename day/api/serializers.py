from rest_framework.serializers import ModelSerializer

from day.models import Day
from exercise.api.serializers import ExerciseSerializer


class DaySerializer(ModelSerializer):
    """
    Serializer to handle Days (Workout)
    """

    exercises = ExerciseSerializer(many=True)

    class Meta:
        model = Day
        fields = [
            'id',
            'day_number',
            'exercises'
        ]
        read_only_fields = ['id']
