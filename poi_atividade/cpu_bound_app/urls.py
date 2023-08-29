from django.urls import path
from . import views

urlpatterns = [
    path('cpu_bound/', views.cpu_intensive, name='fibonacci'),
]