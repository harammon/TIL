from django.urls import path
from . import views

app_name = 'workapp'
urlpatterns = [
    path('exercise1/', views.exercise1, name = 'exercise1'),
    path('exercise2/', views.exercise2, name = 'exercise2'),
]