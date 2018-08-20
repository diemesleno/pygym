from rest_framework import permissions


# Custom permission
class AnonPermissionOnly(permissions.BasePermission):
    message = "You are already authenticated. Please, log out and try again."
    """
    Non-authenticated Users only
    """
    def has_permission(self, request, view):
        return not request.user.is_authenticated
