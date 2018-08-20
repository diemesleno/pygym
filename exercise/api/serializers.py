from rest_framework import serializers

from exercise.models import Exercise


class ExerciseSerializer(serializers.ModelSerializer):
    """
    Serializer to handle Exercises
    """
    class Meta:
        model = Exercise
        fields = [
            'id',
            'name'
        ]
        read_only_field = ['id']
