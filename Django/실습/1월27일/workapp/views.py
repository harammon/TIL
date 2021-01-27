from django.shortcuts import render
from django.http import HttpResponse
from django.template import loader

def exercise1(request) :
    template = loader.get_template('exercise1.html')
    return HttpResponse(template.render(None, request))