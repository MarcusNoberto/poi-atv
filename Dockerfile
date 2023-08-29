# Use uma imagem base do Python 3.11.4 no sistema operacional Debian Bullseye
FROM python:3.11.4-bullseye

# Define a variável de ambiente para evitar o buffer de saída do Python
ENV PYTHONUNBUFFERED=1

# Define o diretório de trabalho dentro do contêiner
WORKDIR /poi_atividade

# Copia o arquivo requirements.txt para o diretório de trabalho
COPY requirements.txt .

# Atualiza o sistema e instala as dependências necessárias
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    # Aqui você precisa especificar as dependências que seu projeto requer, por exemplo:
    # libpq-dev (para PostgreSQL), libmysqlclient-dev (para MySQL), etc.
    && rm -rf /var/lib/apt/lists/*

# Copia todos os arquivos do diretório atual (provavelmente o código-fonte do seu projeto) para o diretório de trabalho
COPY . .

# Expõe a porta 8000 (a porta em que o servidor Django será executado)
EXPOSE 8000

# Define o diretório de trabalho para onde o manage.py está localizado
WORKDIR /poi_atividade

# Atualiza o pip e instala as dependências do projeto a partir do requirements.txt
RUN pip install --upgrade pip setuptools && \
    pip install -r requirements.txt

CMD python3.11 poi_atividade/manage.py runserver 0.0.0.0:8000
# Inicializa o servidor Django quando o contêiner for executado
