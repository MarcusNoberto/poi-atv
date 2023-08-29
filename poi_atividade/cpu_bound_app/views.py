from django.shortcuts import render

# Create your views here.
from django.http import JsonResponse
import time
import math
import concurrent.futures

def cpu_intensive(request):
    result = 0
    while True:
        for _ in range(10_000_000):
            result += math.sqrt(_)
        return JsonResponse({"message": "CPU-bound operation completed"})