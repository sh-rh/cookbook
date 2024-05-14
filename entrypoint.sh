#!/bin/sh

cd config/
python manage.py makemigrations
python manage.py migrate --noinput
python manage.py collectstatic --noinput

if [ "$DJANGO_SUPERUSER_USERNAME" ]
then
    python manage.py createsuperuser \
        --noinput \
        --username $DJANGO_SUPERUSER_USERNAME \
        --email $DJANGO_SUPERUSER_EMAIL
fi

exec "$@"

gunicorn config.wsgi:application --bind 0.0.0.0:8000