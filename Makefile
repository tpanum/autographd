.PHONY: all

all:
	@sh src/node_configure.sh
	@sh src/configure.sh
	@sh src/make.sh

compile:
	@sh src/make.sh
