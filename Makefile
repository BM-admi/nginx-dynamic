CONTAINER := nginx-dynamic
all:
	shellcheck $$(git ls-files *.sh)
	docker-compose up --build --force-recreate --remove-orphans -d
	docker exec -it $(CONTAINER) nginx -t
	docker exec -it $(CONTAINER) cat /etc/nginx/conf.d/default.conf
	curl -fisk GET localhost:80

clean:
	docker-compose down -v
