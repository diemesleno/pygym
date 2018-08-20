from django.contrib import admin

from .models import Plan


class PlanAdmin(admin.ModelAdmin):
    list_display = ('name', 'get_days', 'get_users')

    def get_days(self, obj):
        return ', '.join([str(d) for d in obj.days.all()])

    get_days.allow_tags = True
    get_days.short_description = ("Days")

    def get_users(self, obj):
        return ', '.join([str(u) for u in obj.users.all()])

    get_users.allow_tags = True
    get_users.short_description = ("Users")


admin.site.register(Plan, PlanAdmin)

