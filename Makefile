install:
	./installer.sh

clean:
	sudo rm -rf app/ tmp/
	docker rm `docker ps -a --format '{{.Names}}' | grep 'app_web_run'`; docker rmi app_web
