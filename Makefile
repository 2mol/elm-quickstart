.PHONY: site site-dev watch help

.DEFAULT_GOAL := help

## Build site with optimize and compress resulting javascript.
site:
	elm make src/Main.elm --optimize --output site/main.js
	./deploy/optimize.sh

## Build site without optimizing.
site-dev:
	elm make src/Main.elm --output site/main.js

## Watch files for changes and recompile when necessary.
watch:
	rg --files | entr make dev-build


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
