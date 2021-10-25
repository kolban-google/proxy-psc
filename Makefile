REGION=us-central1
PROJECT=$(shell gcloud config get-value project)
REPO=$(REGION)-docker.pkg.dev/$(PROJECT)/tinyproxy

all:
	@echo "local    - Build locally"
	@echo "registry - Build the artifact registry"
	@echo "build    - Build using Cloud Build and sent to the artifact registry"

local:
	docker build . -t mytinyproxy

build:
	gcloud builds submit . --tag $(REPO)/mytinyproxy

registry:
	gcloud services enable artifactregistry.googleapis.com
	gcloud artifacts repositories create tinyproxy \
  	--repository-format=docker \
  	--location=$(REGION) \
  	--description="Tinyproxy"