APP_NAME?=$(shell pwd | xargs basename)
APP_DIR = /srv/${APP_NAME}
PWD=$(shell pwd)
DOCKER_BASE_IMAGE=elixir:1.11


debug:
	@echo "\e[1m\033[33m\nDebug mode\e[0m"
	@docker run -it -v ${PWD}:${APP_DIR} -w ${APP_DIR} \
		-p 8092:8092 --name ${APP_NAME} ${DOCKER_BASE_IMAGE} bash

run-postgres:
	@docker run --name postgres -p 5432:5432 \
		-e POSTGRES_PASSWORD=postgres -e POSTGRES_USER=postgres \
		-d postgres:13.2
