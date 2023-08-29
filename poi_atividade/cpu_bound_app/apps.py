from django.apps import AppConfig


class CpuBoundAppConfig(AppConfig):
    default_auto_field = 'django.db.models.BigAutoField'
    name = 'cpu_bound_app'
