PATH := $(PATH):$(HOME)/.local/bin:$(HOME)/bin:/bin:/usr/local/bin
SHELL := /usr/bin/env bash

.DEFAULT_GOAL := help

help:
	@printf "\033[36m\033[1m%-10s\033[0m%-55s\033[33m%s\n\n" COMMAND DESCRIPTION
	@grep -E '^[a-zA-Z1-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| awk 'BEGIN { FS = ": ## " }; { printf "\033[36m\033[1m%-10s\033[0m%-55s\033[33m%s\n", $$1, $$2, $$3 }'

build: ## Build Application
	$(info --> Build application)
	@bin/docker build

run: ## Run Application
	$(info --> Run application)
	@bin/docker run

install: ## Install Application
	$(info --> Install application)
	@bin/docker install

stop: ## Stop Application
	$(info --> Stop application)
	@bin/docker stop

destroy: ## Destroy Application
	$(info --> Destroy application)
	@bin/docker destroy

expelliarmus: ## Prune docker env
	$(info --> Prune docker env)
	@bin/docker expelliarmus

avadakedavra: ## Stop then destroy containers + images
	$(info --> Stop then destroy containers + images)
	@bin/docker avadakedavra
