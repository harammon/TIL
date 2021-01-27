from django.urls import path
from . import views

app_name = 'workapp'
urlpatterns = [
    path('', views.exercise1, name = 'exercise1'),
]