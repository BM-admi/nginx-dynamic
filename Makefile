all:
	shellcheck $$(git ls-files *.sh)
	docker-compose up --build --force-recreate --remove-orphans -d

clean:
	docker-compose down -v
