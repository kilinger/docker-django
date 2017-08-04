FROM index.xxxxx.com/django:2

RUN mkdir -p /app
RUN mkdir -p /app/media
RUN mkdir -p /app/site-static

WORKDIR /app

ONBUILD COPY . /app
ONBUILD run pip install -r requirements.txt --no-cache-dir --index-url http://pypi.xxxxx.com/prod/pypi/+simple/ --trusted-host pypi.xxxxx.com

VOLUME /app/media
VOLUME /app/site-static
