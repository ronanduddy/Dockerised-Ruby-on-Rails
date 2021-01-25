.PHONY: install stop clean

install:
	./installer.sh

stop:
	(cd app && make stop)

clean:
	sudo rm -rf app/ tmp/
	docker image prune -f
	docker ps -a | grep "app_test\|app_web\|app_db" | awk '{print $$1}' | xargs docker rm -f | true
	docker images -a | grep "app_test\|app_web" | awk '{print $$3}' | xargs docker rmi -f | true
	docker volume rm app_pg-data | true
	docker volume rm app_test-pg-data | true
