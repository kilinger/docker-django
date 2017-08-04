#!/bin/bash
set -e

if [ ${DB_MIGRATE} == "**False**" ]; then
	unset DB_MIGRATE
fi

if [ -n "${DB_MIGRATE}" ]; then
	echo "DB sync"
	python manage.py syncdb --noinput
	echo "DB sync done"

	echo "DB migrate"
	python manage.py migrate
	echo "DB migrate done"
fi
