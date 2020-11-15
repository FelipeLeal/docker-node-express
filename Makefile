up:
	docker-compose up -d --build node
down:
	docker-compose down -v
rebuild:
	docker-compose down -v && docker-compose up -d --build node
recreate:
	docker-compose up -d --force-recreate
start:
	docker-compose start
stop:
	docker-compose stop
restart:
	docker-compose restart
shell:
	docker-compose exec --user root node sh
image-prune:
	docker image prune -a
volume-prune:
	docker volume prune
cont-prune:
	docker container prune
