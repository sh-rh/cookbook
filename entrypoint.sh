#!/bin/sh

python config/manage.py flush --no-input
python config/manage.py makemigrations
python config/manage.py migrate --noinput
python config/manage.py collectstatic --noinput
python config/manage.py runserver 0.0.0.0:8000