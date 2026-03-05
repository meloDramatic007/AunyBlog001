COMPOSE ?= docker compose
SVC      ?= app
SVC_NODE ?= node  # Pointing to your 'node' service

php      = $(COMPOSE) exec $(SVC) php
# Change: npm now points to the SVC_NODE service
npm = $(COMPOSE) exec $(SVC) npm 
composer = $(COMPOSE) exec $(SVC) composer
shell    = $(COMPOSE) exec $(SVC) sh

.PHONY: start stop up build-up build-nc down in in-root refresh npm-install npm-run-dev composer-update migrate init composer-dump fix-permissions

start:      ; $(COMPOSE) start
stop:       ; $(COMPOSE) stop
up:         ; $(COMPOSE) up -d
build-up:   ; $(COMPOSE) up -d --build
build-nc:   ; $(COMPOSE) build --no-cache
down:       ; $(COMPOSE) down

in:         ; $(shell)
# uses the explicit container_name from docker-compose for root shell
in-root:    ; docker exec -it --user root meloDramatic007-php /bin/sh

refresh:    ; $(php) artisan config:clear && $(php) artisan cache:clear && $(php) artisan config:cache
npm-install:; $(npm) install
npm-run-dev:; $(npm) run dev
composer-update: ; $(composer) update
migrate:    ; $(php) artisan migrate

# Updated init to use the service variables
init: 
	docker exec -it meloDramatic007-php chown -R melo_dramatic:melo_dramatic /var/www/html
	$(composer) update
	$(npm) install

composer-dump: ; $(composer) dump-autoload

fix-permissions: ; docker exec -it meloDramatic007-php chown -R melo_dramatic:melo_dramatic /var/www/html