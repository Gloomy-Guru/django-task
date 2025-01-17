FROM python:3.11-slim

WORKDIR /app
COPY ./requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt
RUN pip install gunicorn

COPY . .
RUN python manage.py migrate
RUN python manage.py collectstatic

EXPOSE 8000
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "djangotask.wsgi:application"]
