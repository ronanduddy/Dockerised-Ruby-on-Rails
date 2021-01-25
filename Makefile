.PHONY: install run stop clean clean_files docker_clean

install:
	./installer.sh

run:
	(cd app && make run)

stop:
	(cd app && make stop)

clean: clean_files docker_clean

clean_files:
	sudo rm -rf app/ tmp/

docker_clean:
	docker image prune -f
	docker ps -a | grep "app_test\|app_web\|app_db" | awk '{print $$1}' | xargs docker rm -f | true
	docker images -a | grep "app_test\|app_web" | awk '{print $$3}' | xargs docker rmi -f | true
	docker volume rm app_pg-data | true
	docker volume rm app_test-pg-data | true
