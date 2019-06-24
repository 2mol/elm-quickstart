.PHONY: build deploy watch help

ELM=elm
DEPLOY_SERVER=127.0.0.1
DEPLOY_USER=anon
DEPLOY_FOLDER=site/

.DEFAULT: build

## Build site and collect all assets in site/ subfolder.
build:
	elm make src/Main.elm --optimize --output site/main.js

## Transfer the compiled site and its assets to the server.
deploy: build
	rsync -crv -e ssh --delete site/ $(DEPLOY_USER)@$(DEPLOY_SERVER):$(DEPLOY_FOLDER)

## Watch files for changes and recompile when necessary.
watch:
	rg --files | entr make build


# coloured `make` help text, courtesy of
# https://gist.github.com/prwhite/8168133#gistcomment-2278355

GREEN  := $(shell tput -Txterm setaf 2)
YELLOW := $(shell tput -Txterm setaf 3)
WHITE  := $(shell tput -Txterm setaf 7)
RESET  := $(shell tput -Txterm sgr0)

TARGET_MAX_CHAR_NUM=10
## Show this help.
help:
	@echo 'Usage:'
	@echo '  ${YELLOW}make${RESET} ${GREEN}<target>${RESET}'
	@echo ''
	@echo 'Targets:'
	@awk '/^[a-zA-Z\-\_0-9]+:/ { \
		helpMessage = match(lastLine, /^## (.*)/); \
		if (helpMessage) { \
			helpCommand = substr($$1, 0, index($$1, ":")-1); \
			helpMessage = substr(lastLine, RSTART + 3, RLENGTH); \
			printf "  ${YELLOW}%-$(TARGET_MAX_CHAR_NUM)s${RESET} ${GREEN}%s${RESET}\n", helpCommand, helpMessage; \
		} \
	} \
	{ lastLine = $$0 }' $(MAKEFILE_LIST)
