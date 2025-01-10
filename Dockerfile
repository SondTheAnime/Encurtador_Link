FROM python:3.11-slim

# Define o diretório de trabalho
WORKDIR /app

# Instala o git e outras dependências necessárias
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

# Copia os requisitos primeiro para aproveitar o cache do Docker
COPY requirements.txt .

# Atualiza pip e instala as dependências
RUN pip install --upgrade pip && pip install --no-cache-dir -r requirements.txt

# Copia o resto do código
COPY . .

# Expõe a porta 8000
EXPOSE 8000

# Comando para executar as migrações e iniciar o servidor
CMD ["sh", "-c", "python manage.py migrate && python manage.py runserver 0.0.0.0:8000"]