from django.contrib import admin

from .models import Day


class DayAdmin(admin.ModelAdmin):
    list_display = ('day_number', 'get_exercises')

    def get_exercises(self, obj):
        """
        Shows the workout exercises
        """
        return ', '.join([str(e) for e in obj.exercises.all()])

    get_exercises.allow_tags = True
    get_exercises.short_description = ("Exercises")


admin.site.register(Day, DayAdmin)
