build:
	docker build -t shippy-email-service .
image:
	docker build -t shippy-email-service .
micro: 
	docker run --net="host" -p 8080:8080 -e MICRO_REGISTRY=mdns microhq/micro api --handler=rpc --address=:8080 --namespace=shippy
run:
	docker run --net="host" \
		-p 50054 \
		-e MICRO_SERVER_ADDRESS=:50054 \
		-e MICRO_REGISTRY=mdns \
		shippy-email-service
postgres: 
	docker run -p 5432:5432 -e POSTGRES_PASSWORD=password postgres