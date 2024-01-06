UNAME := $(shell uname)

ifeq ($(UNAME), Windows)
    UID=1000
    GID=1000
else
    UID=`id -u`
    GID=`id -g`
endif

SHELL_COMMAND = bash

all: web

docker-web:
	docker build -t godot-web ./scripts/web

shell-web: docker-web
	docker run -it --rm -v ${CURDIR}:${CURDIR} --user ${UID}:${GID} -w ${CURDIR} godot-web ${SHELL_COMMAND}

web:
	$(MAKE) shell-web SHELL_COMMAND='./scripts/web/build.sh'
	$(MAKE) shell-web SHELL_COMMAND='./scripts/web/build_debug.sh'
