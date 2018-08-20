from django.db import models

from exercise.models import Exercise


class Day(models.Model):
    """
    Class to manage workout days
    """
    day_number = models.IntegerField()
    exercises = models.ManyToManyField(Exercise, blank=True)

    def __str__(self):
        return str(self.day_number)
