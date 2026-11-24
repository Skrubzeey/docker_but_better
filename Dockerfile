FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY data_prep.py .
COPY train.py .
COPY evaluate.py .
COPY .env.example .

RUN mkdir -p /app/models

CMD ["sh", "-c", "python train.py && python evaluate.py"]