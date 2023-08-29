FROM python:3.11.4-bullseye

ENV PYTHONUNBUFFERED=1

WORKDIR /poi_atividade

COPY requirements.txt .

COPY . .

EXPOSE 8000

WORKDIR /poi_atividade

RUN pip install --upgrade pip setuptools && \
    pip install -r requirements.txt

CMD python3.11 poi_atividade/manage.py runserver 0.0.0.0:8000
