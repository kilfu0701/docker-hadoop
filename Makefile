current_branch := $(shell git rev-parse --abbrev-ref HEAD)

build:
	docker build  -t kilfu0701/hadoop-base:$(current_branch) -f base/Dockerfile .
	docker build --no-cache -t kilfu0701/hadoop-namenode:$(current_branch) -f namenode/Dockerfile .
	docker build --no-cache -t kilfu0701/hadoop-datanode:$(current_branch) -f datanode/Dockerfile .
	docker build --no-cache -t kilfu0701/hadoop-resourcemanager:$(current_branch) -f resourcemanager/Dockerfile .
	docker build --no-cache -t kilfu0701/hadoop-nodemanager:$(current_branch) -f nodemanager/Dockerfile .
	docker build --no-cache -t kilfu0701/hadoop-historyserver:$(current_branch) -f historyserver/Dockerfile .

test_historyserver:
	docker run --env-file hadoop-hive.env -ti kilfu0701/hadoop-base:3.3.2-java8 yarn --config /opt/hadoop-3.3.2/etc/hadoop historyserver
