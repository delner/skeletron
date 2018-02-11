.PHONY: build-gem build-image bash rspec

# Gem
# ---

build-gem:
	gem build skeletron.gemspec

# Docker
# ------

build-image:
	docker-compose build

bash:
	docker-compose run --rm skeletron /bin/bash

console:
	docker-compose run --rm skeletron ./bin/console

rspec:
	docker-compose run --rm skeletron bundle exec rspec

rubocop:
	docker-compose run --rm skeletron bundle exec rubocop
