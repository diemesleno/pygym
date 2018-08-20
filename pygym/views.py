from django.views.generic import View, TemplateView
from django.shortcuts import redirect


class IndexView(View):
    """
    View to redirect the user to the API Endpoint Base
    """
    def get(self, request, *args, **kwargs):
        return redirect('/api/v1/')


class Template404View(TemplateView):
    """
    Used to handle Page not Found error
    """
    template_name = '404.html'


class Template500View(TemplateView):
    """
    Used to handle Server Error Page
    """
    template_name = '500.html'
