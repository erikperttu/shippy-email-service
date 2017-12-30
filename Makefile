build:
	docker build -t shippy-email-service .
image:
	docker build -t shippy-email-service .
run:
	docker run --net="host" \
		-p 50054 \
		-e MICRO_SERVER_ADDRESS=:50054 \
		-e MICRO_REGISTRY=mdns \
		-e MICRO_BROKER=nats \
		-e MICRO_BROKER_ADDRESS=0.0.0.0:4222 \
		shippy-email-service