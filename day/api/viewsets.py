from django.db import transaction, IntegrityError
from rest_framework.response import Response
from rest_framework.viewsets import ModelViewSet

from day.models import Day
from .serializers import DaySerializer


class DayViewSet(ModelViewSet):
    """
    Day Basic ViewSet
    """
    queryset = Day.objects.all()
    serializer_class = DaySerializer

    def create(self, request, *args, **kwargs):
        """
        Create a workout day with all exercises
        """
        exercises = request.data.pop('exercises', None)

        try:
            with transaction.atomic():
                day = Day.objects.create(**request.data)
                if exercises:
                    day.exercises.set(exercises)
                    day.save()
                serializer = DaySerializer(day)
                return Response(serializer.data, 201)
        except IntegrityError:
            return Response({'error: ': 'You must inform valid exercises'}, 403)

    def update(self, request, *args, **kwargs):
        """
        Update a workout day with all exercises
        """
        exercises = request.data.pop('exercises', None)

        try:
            with transaction.atomic():
                instance = self.get_object()
                if 'day_number' in request.data:
                    instance.day_number = request.data['day_number']
                    if exercises:
                        instance.exercises.remove()
                        instance.exercises.set(exercises)
                    instance.save()
                    serializer = DaySerializer(instance)
                    return Response(serializer.data, 200)
        except IntegrityError:
            return Response({'error: ': 'You must inform valid exercises'}, 403)

