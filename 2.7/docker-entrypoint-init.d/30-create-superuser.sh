#!/usr/bin/env sh

if [ -n "${ADMIN_USER}" ] && [ -n "${ADMIN_PASSWORD}" ] && [ -n "${ADMIN_EMAIL}" ]; then
    echo "Create superuser"
    echo "from django.contrib.auth import get_user_model; User = get_user_model(); User.objects.create_superuser('${ADMIN_USER}', '${ADMIN_EMAIL}', '${ADMIN_PASSWORD}')" | python manage.py shell
    if [ -n "${ADMIN_EXTRA}" ]; then
        echo "from django.contrib.auth import get_user_model; User = get_user_model(); user=User.objects.filter(username='${ADMIN_USER}', email='${ADMIN_EMAIL}'); user.update(**dict(${ADMIN_EXTRA}))" | python manage.py shell
    fi
    echo "Create superuser done"
fi
