from django.db import models
from django.contrib.auth import get_user_model

from day.models import Day


class Plan(models.Model):
    """
    Class to manage Plans
    """
    name = models.CharField(max_length=120)
    days = models.ManyToManyField(Day, blank=True)
    users = models.ManyToManyField(get_user_model(), blank=True)

    def __str__(self):
        return self.name
