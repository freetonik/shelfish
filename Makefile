compose-build:
	docker-compose build

compose-up:
	docker-compose up -d web

compose-stop:
	docker-compose stop

compose-kill:
	docker-compose kill	

compose-rails:
	docker-compose run web bin/rails $(T)

compose-db-prepare:
	make compose-rails T=db:create || true
	make compose-rails T=db:structure:load || true
	make compose-rails T=db:migrate
	
# build:
# 	docker build -t shelfish .

# run:
# 	docker run -p 3000:3000 -itP -v `pwd`:/app shelfish