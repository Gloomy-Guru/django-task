FROM python:3.11-slim

WORKDIR /app
COPY ./requirements.txt .

RUN python -m pip install --upgrade pip && pip install --no-cache-dir -r requirements.txt
RUN pip install gunicorn

COPY . .
RUN python manage.py migrate
RUN python manage.py collectstatic

EXPOSE 8000
