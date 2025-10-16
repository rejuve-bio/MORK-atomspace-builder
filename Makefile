.PHONY: build copy-env run-ui down

build: copy-env
	docker compose up -d --build ; \
	$(MAKE) run-ui


copy-env:
	cp ./env/annotation-backend.env ./annotation-query-backend-general/.env
	cp ./env/annotation-tool.env ./annotation-tool/.env
	cp ./env/custom-atomspace-builder.env ./custom-atomspace-builder/.env
	cp ./env/docker-compose.env ./.env

run-ui:
	cd ./annotation-tool && docker build -t ui:latest .
	docker rm -f ui || true
	docker run -d -p 3000:3000 --env-file ./annotation-tool/.env --network="host" --name ui ui:latest

down:
	docker compose down -v
	docker rm -f ui || true

mork:
	docker compose --env-file env/atomspace-builder.env -f docker-compose.mork.yml up --build -d

