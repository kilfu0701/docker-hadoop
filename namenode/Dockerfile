FROM kilfu0701/hadoop-base:2.10.1-java8
MAINTAINER BoRu Su <kilfu0701@gmail.com>

HEALTHCHECK CMD curl -f http://localhost:50070/ || exit 1

ENV HDFS_CONF_dfs_namenode_name_dir=file:///hadoop/dfs/name
RUN mkdir -p /hadoop/dfs/name
VOLUME /hadoop/dfs/name

ADD namenode/run.sh /run.sh
RUN chmod a+x /run.sh

EXPOSE 50070

CMD ["/run.sh"]
