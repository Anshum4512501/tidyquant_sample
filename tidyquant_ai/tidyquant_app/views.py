from django.shortcuts import render
from django.http import HttpResponse
from django.views.generic import TemplateView
# Create your views here.

class HomePage(TemplateView):
    template_name = 'tidyquant/home.html'