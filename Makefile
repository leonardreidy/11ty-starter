include ./scripts/includes/all.mk
include .env

build :
	@echo "-----------------------------------------------------------------"
	@echo "Building..."
	@echo "-----------------------------------------------------------------"
	npx @11ty/eleventy

# del or del-cli is similar to rm -rf in Unix-like systems, or rimraf.
# Benefits over rimraf CLI: Supports globbing (even on Windows), safer 
# by default as it doesn't allow deleting parent directories, and has 
# a dry-run mode. Benefits over rm -rf: Cross-platform, safer by default 
# as it doesn't allow deleting parent directories, and has a dry-run mode.
clean :
	@echo "-----------------------------------------------------------------"
	@echo "Cleaning..."
	@echo "-----------------------------------------------------------------"
	del _site

# When in --watch mode, Eleventy will spider the dependencies of your JavaScript 
# Templates (.11ty.js), JavaScript Data Files (.11tydata.js or _data/**/*.js), 
# or Configuration File (usually .eleventy.js) to watch those files too. Files in 
# node_modules directories are ignored. This feature is enabled by default.
# The incremental flag ensures that repeat builds only operate on files that have changed
dev :
	@echo "-----------------------------------------------------------------"
	@echo "Watching..."
	@echo "-----------------------------------------------------------------"
	npx @11ty/eleventy --watch --serve --incremental --port=$(PORT)

purge :
	@echo "-----------------------------------------------------------------"
	@echo "Purging..."
	@echo "-----------------------------------------------------------------"
	del node_modules

report :
	@echo "OS: $(OSFLAG)"
	@echo "BASE_URL: $(BASE_URL)"
	@echo "ELEVENTY_PORT: $(ELEVENTY_PORT)"
	@echo "HOST: $(HOST)"
	@echo "PORT: $(PORT)"

serve :
	@echo "-----------------------------------------------------------------"
	@echo "Serving..."
	@echo "-----------------------------------------------------------------"
	npx @11ty/eleventy --serve --port=$(PORT)

setup :
	@echo "-----------------------------------------------------------------"
	@echo "Initializing..."
	@echo "-----------------------------------------------------------------"
	npm install

start :
	@echo "-----------------------------------------------------------------"
	@echo "Starting..."
	@echo "-----------------------------------------------------------------"
	npx @11ty/eleventy --serve --port=$(PORT)

.PHONY: all
all : report

