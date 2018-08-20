from rest_framework.viewsets import ModelViewSet

from exercise.models import Exercise
from .serializers import ExerciseSerializer


class ExerciseViewSet(ModelViewSet):
    """
    Exercise Basic ViewSet
    """
    queryset = Exercise.objects.all()
    serializer_class = ExerciseSerializer
