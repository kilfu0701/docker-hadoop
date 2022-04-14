current_branch := $(shell git rev-parse --abbrev-ref HEAD)

build:
	docker build -t kilfu0701/hadoop-base:$(current_branch) -f base/Dockerfile .
	docker build --no-cache -t kilfu0701/hadoop-namenode:$(current_branch) -f namenode/Dockerfile .
	docker build --no-cache -t kilfu0701/hadoop-datanode:$(current_branch) -f datanode/Dockerfile .
	docker build --no-cache -t kilfu0701/hadoop-resourcemanager:$(current_branch) -f resourcemanager/Dockerfile .
	docker build --no-cache -t kilfu0701/hadoop-nodemanager:$(current_branch) -f nodemanager/Dockerfile .
	docker build --no-cache -t kilfu0701/hadoop-historyserver:$(current_branch) -f historyserver/Dockerfile .
