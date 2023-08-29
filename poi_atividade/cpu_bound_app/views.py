from django.shortcuts import render

# Create your views here.
from django.http import JsonResponse
import time
import math
import concurrent.futures

def cpu_intensive(request):
    result = 0
    while True:
        for c in range(100000000):
            result += math.sqrt(c)
        return JsonResponse({"message": "CPU-bound operation completed"})
