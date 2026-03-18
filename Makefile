.PHONY: dev reset rebuild stop logs erp pim magento

dev:
	docker-compose up -d

rebuild:
	docker-compose up -d --build --force-recreate

reset:
	docker-compose down -v
	docker-compose up -d --build --force-recreate

stop:
	docker-compose down

logs:
	docker-compose logs -f

erp:
	docker exec -it erp bash

pim:
	docker exec -it pim bash

magento:
	docker exec -it magento bash