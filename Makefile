SHELL=/bin/bash

.DEFAULT_GOAL := help

## release:	Checkout trunk, get most recent version, create new (minor) tag, push trunk and tags
.PHONY: release
release:
	git checkout trunk
	git pull
	bin/bump-tag.sh
	git push origin trunk && git push --tags
	./deploy

## branch:	Checkout trunk, get most recent version, create new branch based on trunk
.PHONY: branch
branch:
	git checkout trunk
	git pull
	@read -p "Enter Branch Name: " branchName; \
	git checkout -b $$branchName

## help:		Print this message
.PHONY: help
help: Makefile
	@sed -n 's/^##//p' $<
