U := ubuntu

compose-build:
	docker-compose build

compose-up:
	docker-compose up -d web

# non-detached mode
compose-up-bash:
	docker-compose up web

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
# 	docker build -t freetonik/shelfish:$(TAG) .

docker-build:
	git clone git@github.com:freetonik/shelfish.git /var/tmp/shelfish || true
	cd /var/tmp/shelfish && git fetch && git checkout $(TAG) && git clean -fd
	docker build -t freetonik/shelfish:$(TAG) /var/tmp/shelfish/
	docker push freetonik/shelfish:$(TAG)

ansible-deps-install:
		ansible-galaxy install -r requirements.yml

ansible-site-setup:
		ansible-playbook ansible/site.yml -i ansible/production -u $U -vv

ansible-site-deploy:
		ansible-playbook ansible/deploy.yml -i ansible/production -u $U

# run:
# 	docker run -p 3000:3000 -itP -v `pwd`:/app shelfish