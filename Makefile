run : email-service micro 
.PHONY: run
build:
	docker build -t shippy-email-service .
image:
	docker build -t shippy-email-service .
micro: 
	docker run --net="host" -p 8080:8080 -e MICRO_REGISTRY=mdns microhq/micro api --handler=rpc --address=:8080 --namespace=shippy
email-service: 
	docker run -d --net="host" \
		-p 50054 \
		-e MICRO_SERVER_ADDRESS=:50054 \
		-e MICRO_REGISTRY=mdns \
		shippy-email-service
	timeout 3