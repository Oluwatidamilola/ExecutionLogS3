FROM python:3.13.0b2-slim

WORKDIR /app

COPY app.py .
COPY requirements.txt .

RUN pip install -r requirements.txt

CMD ["python", "app.py"]

EXPOSE 5000
