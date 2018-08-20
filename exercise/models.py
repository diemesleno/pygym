from django.db import models


class Exercise(models.Model):
    """
    Class to manage Exercises
    """
    name = models.CharField(max_length=120)

    def __str__(self):
        return self.name
