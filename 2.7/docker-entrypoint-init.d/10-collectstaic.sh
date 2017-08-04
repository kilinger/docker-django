#!/bin/bash
set -e

if [ ${ENABLE_COMPRESS} == "**False**" ]; then
	unset ENABLE_COMPRESS
fi

if [ -n "${ENABLE_COMPRESS}" ]; then
	echo "Compress statics"
	python manage.py compress
	echo "Compress statics done"
fi

IGNORE_STATICS=${IGNORE_STATICS:-''}

ignores=""
for i in $(echo $IGNORE_STATICS | tr ";" "\n")
do
	ignores+="--ignore $i "
done

echo "Collectstatic"
python manage.py collectstatic --noinput $ignores
echo "Collectstatic done"
