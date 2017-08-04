all: build-2.7 build-2.7-onbuild

build-2.7:
	docker build -t index.xxxxx.com/django:2.7 2.7
	docker build -t index.xxxxx.com/django:2 2.7

build-2.7-onbuild:
	docker build -t index.xxxxx.com/django:2.7-onbuild 2.7/onbuild
	docker build -t index.xxxxx.com/django:2-onbuild 2.7/onbuild

publish: build-2.7 build-2.7-onbuild
	docker push index.xxxxx.com/django:2.7
	docker push index.xxxxx.com/django:2
	docker push index.xxxxx.com/django:2.7-onbuild
	docker push index.xxxxx.com/django:2-onbuild
