current_branch := $(shell git rev-parse --abbrev-ref HEAD)

build:
	docker buildx build --push --platform linux/amd64,linux/arm64,linux/amd64/v2 --no-cache -t kilfu0701/hadoop-namenode:$(current_branch) -f namenode/Dockerfile .
	docker buildx build --push --platform linux/amd64,linux/arm64,linux/amd64/v2 --no-cache -t kilfu0701/hadoop-datanode:$(current_branch) -f datanode/Dockerfile .
	docker buildx build --push --platform linux/amd64,linux/arm64,linux/amd64/v2 --no-cache -t kilfu0701/hadoop-resourcemanager:$(current_branch) -f resourcemanager/Dockerfile .
	docker buildx build --push --platform linux/amd64,linux/arm64,linux/amd64/v2 --no-cache -t kilfu0701/hadoop-nodemanager:$(current_branch) -f nodemanager/Dockerfile .
	docker buildx build --push --platform linux/amd64,linux/arm64,linux/amd64/v2 --no-cache -t kilfu0701/hadoop-historyserver:$(current_branch) -f historyserver/Dockerfile .

build_base_all:
	docker buildx build --push --platform linux/amd64,linux/arm64,linux/amd64/v2 --no-cache -t kilfu0701/hadoop-base:$(current_branch) -f base/Dockerfile .

clean:
	docker image prune

test_historyserver:
	docker run --env-file hadoop-hive.env -ti kilfu0701/hadoop-base:2.10.1-java8 yarn --config /opt/hadoop-2.10.1/etc/hadoop historyserver
