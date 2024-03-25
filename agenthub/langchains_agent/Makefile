REGISTRY=ghcr.io
ORG=infiniteaicreations
REPO=langchains_agent
TAG=v0.2
FULL_IMAGE=$(REGISTRY)/$(ORG)/$(REPO):$(TAG)
LATEST_FULL_IMAGE=$(REGISTRY)/$(ORG)/$(REPO):latest

# normally, for local build testing or development. use cross platform build for sharing images to others.
build:
	docker build -f Dockerfile -t ${FULL_IMAGE} -t ${LATEST_FULL_IMAGE} .

push:
	docker push ${FULL_IMAGE} ${LATEST_FULL_IMAGE}

test:
	docker buildx build --platform linux/amd64 \
	-t ${FULL_IMAGE} -t ${LATEST_FULL_IMAGE} --load -f Dockerfile .

# cross platform build, you may need to manually stop the buildx(buildkit) container
all:
	docker buildx build --platform linux/amd64,linux/arm64 \
	-t ${FULL_IMAGE} -t ${LATEST_FULL_IMAGE} --push -f Dockerfile .