compose-build:
	docker-compose build

compose-up:
	docker-compose up -d web

compose-stop:
	docker-compose stop

compose-kill:
	docker-compose kill	

# build:
# 	docker build -t shelfish .

# run:
# 	docker run -p 3000:3000 -itP -v `pwd`:/app shelfish