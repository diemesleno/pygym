from django.contrib.auth.models import User
from django.core.exceptions import ObjectDoesNotExist
from django.db import transaction, IntegrityError
from django.shortcuts import get_object_or_404

from django.contrib.auth import get_user_model

from rest_framework.decorators import action
from rest_framework.viewsets import ModelViewSet
from rest_framework.response import Response

from day.models import Day
from plan.models import Plan
from .serializers import PlanSerializer

from pygym.email_utils import send_mail


class PlanViewSet(ModelViewSet):
    """
    Plan Basic ViewSet
    """
    queryset = Plan.objects.all()
    serializer_class = PlanSerializer

    def create(self, request, *args, **kwargs):
        """
        Create the Plan
        """
        if request.data and 'name' in request.data:
            days = request.data.pop('days', None)
            users = request.data.pop('users', None)

            try:
                with transaction.atomic():
                    plan = Plan.objects.create(**request.data)
                    if days:
                        for day in days:
                            exercises = day.pop('exercises')
                            day = Day.objects.create(**day)
                            day.exercises.set(exercises)
                            plan.days.add(day)
                    else:
                        return Response({'message': 'You must inform the days with the exercises'}, 403)
                    if users:
                        for user in users:
                            plan.users.add(user)
                    serializer = PlanSerializer(plan)
                    return Response(serializer.data, 201)
            except IntegrityError:
                return Response({'message': 'You must inform the days with valid exercises or valid users'}, 403)
        else:
            return Response({'message': 'You must inform the data'}, 403)

    def update(self, request, *args, **kwargs):
        """
        Update a plan and send email to all users
        """
        if request.data:
            days = request.data.pop('days', None)
            users = request.data.pop('users', None)

            try:
                with transaction.atomic():
                    instance = self.get_object()
                    if 'name' in request.data:
                        instance.name = request.data['name']
                    if days:
                        instance.days.remove()
                        for day in days:
                            exercises = day.pop('exercises')
                            day = Day.objects.create(**day)
                            day.exercises.set(exercises)
                            instance.days.add(day)
                    else:
                        return Response({'message': 'You must inform the days with the exercises'}, 403)
                    if users:
                        instance.users.remove() # We could not remove the old users...
                        for user in users:
                            instance.users.add(user)
                            u = User.objects.get(pk=user)
                            send_mail(
                                "Your VirtuaGym plan was modified",
                                "Dear VirtuaGym user, your plan {0} was modified. Please, check it when be possible"
                                    .format(instance.name),
                                u.email
                            )
                    serializer = PlanSerializer(instance)
                    return Response(serializer.data, 201)
            except IntegrityError:
                return Response({'message': 'You must inform the days with valid exercises or valid users'}, 403)
        else:
            return Response({'message': 'You must inform the data'}, 403)

    @action(methods=['post'], detail=True)
    def add_user(self, request, pk):
        """
        Add user the a plan and send email to the user added
        """
        if 'users' in request.data:
            users = request.data['users']
            for user in users:
                try:
                    u = get_user_model().objects.get(pk=user)
                    Plan.objects.get(pk=pk).users.add(u)
                    """
                    The best option here would be create a task on Celery + Redis or another task app + 
                    message broker to send all the emails later...
                    """
                    send_mail("Plan added with success", "Thank you for subscribe in your new Virtuagym Plan", u.email)
                except ObjectDoesNotExist:
                    return Response({'error': 'The user with id {0} does not exist.'.format(user)})
            return Response({'message': 'Users added on this plan'}, 200)
        else:
            return Response({'error': 'You must inform at least one user'}, 403)
