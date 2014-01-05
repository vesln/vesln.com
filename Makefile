#
# Paths
#

SERVER = node_modules/.bin/serve
MINIFY = node_modules/.bin/minify

#
# All
#

all: install preview

#
# Install
#

install: node_modules

#
# Minify all assets
#

build:
	@$(MINIFY) index.html dist/index.html
	@$(MINIFY) analytics.js dist/analytics.js
	@$(MINIFY) style.css dist/style.css
	@cp favicon.png dist/favicon.png

#
# Start the static file server
#

dev: node_modules
	@$(SERVER)

#
# Build & start the preview
#

preview: node_modules build
	@$(SERVER) dist/

#
# Install node modules
#

node_modules:
	@npm install

#
# Clean
#

clean: clean-node

#
# Clean node modules
#

clean-node:
	@rm -rf node_modules
