.PHONY: all

UID := $(shell id -u)
GID := $(shell id -g)

all:
	docker build --build-arg=UID=$(UID) --build-arg=GID=$(GID)  -t cagrisofu/jpylab3 -f jpylab3/Dockerfile .

