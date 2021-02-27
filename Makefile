APP_NAME?=$(shell pwd | xargs basename)
APP_DIR = /srv/${APP_NAME}
PWD=$(shell pwd)
DOCKER_BASE_IMAGE=elixir:1.11


debug:
	@echo "\e[1m\033[33mDebug mode\e[0m"
ifeq ($(shell docker ps --filter "name=${APP_NAME}-debug" -aq 2> /dev/null | wc -l | bc), 0)
	@docker run -it -v ${PWD}:${APP_DIR} -w ${APP_DIR} \
		-p 4000:4000 --name ${APP_NAME}-debug ${DOCKER_BASE_IMAGE} bash
else
	@docker start ${APP_NAME}-debug
	@docker exec -it ${APP_NAME}-debug bash
endif

run-postgres:
	@docker run --name postgres -p 5432:5432 \
		-e POSTGRES_PASSWORD=postgres -e POSTGRES_USER=postgres \
		-d postgres:13.2

ip:
	@docker ps --filter "name=${APP_NAME}" -aq | \
		xargs docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}'
