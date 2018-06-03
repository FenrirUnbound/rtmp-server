.PHONY: local-build local-run

.DEFAULT_GOAL := local-run

local-build:
	docker build -t rtmp .

local-run:
	docker run --rm -ti -p 8080:80 -p 1935:1935 rtmp:latest
