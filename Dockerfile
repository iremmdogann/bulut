# Python için resmi Docker imajını kullan
FROM python:3.9-slim

# Uygulama kodunu /app dizinine kopyala
WORKDIR /app
COPY . /app

# Gerekli Python paketlerini yükle
RUN pip install --no-cache-dir -r requirements.txt

# Flask uygulamasını çalıştır
CMD ["python", "app.py"]
