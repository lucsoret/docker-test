include ../../../make.inc

build_docker_image:
	docker build -t $(DOCKER_IMAGE_NAME) -f Dockerfile .

run_docker_image:
	docker run --rm -it -p -e PORT=$(PORT) 8000:8000 $(DOCKER_IMAGE_NAME)

push_docker_image:
	docker push $(DOCKER_IMAGE_NAME)

deploy_docker_image:
	gcloud run deploy app --allow-unauthenticated \
		--port $(PORT) --region europe-west1 \
		--image ${DOCKER_IMAGE_NAME} \
		--service-account=wagonaccount@high-radius-413910.iam.gserviceaccount.com
