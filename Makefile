run-node:
	docker-compose down
	docker-compose up -d

test:
	scarb run test