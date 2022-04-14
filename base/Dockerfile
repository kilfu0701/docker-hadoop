FROM debian:bullseye-20220328-slim
MAINTAINER BoRu Su <kilfu0701@gmail.com>

RUN apt update && apt -yq install gnupg curl

RUN apt-key adv \
    --keyserver hkp://keyserver.ubuntu.com:80 \
    --recv-keys 0xB1998361219BD9C9

RUN curl -O https://cdn.azul.com/zulu/bin/zulu-repo_1.0.0-3_all.deb \
    && apt-get install ./zulu-repo_1.0.0-3_all.deb \
    && rm -rf ./zulu-repo_1.0.0-3_all.deb

RUN apt-get update && apt-get install -y zulu8-jdk

ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends net-tools curl netcat

ENV HADOOP_VERSION 2.10.1
ENV HADOOP_URL https://www.apache.org/dist/hadoop/common/hadoop-$HADOOP_VERSION/hadoop-$HADOOP_VERSION.tar.gz
#ENV HADOOP_URL https://archive.apache.org/dist/hadoop/common/hadoop-2.7.4/hadoop-2.7.4.tar.gz

#COPY hadoop-2.10.1.tar.gz /tmp/hadoop.tar.gz

RUN set -x \
    && curl -fSL "$HADOOP_URL" -o /tmp/hadoop.tar.gz \
    #&& curl -fSL "$HADOOP_URL.asc" -o /tmp/hadoop.tar.gz.asc \
    #&& chmod +x /tmp/hadoop.tar.gz.asc /tmp/hadoop.tar.gz \
    #&& gpg --verify /tmp/hadoop.tar.gz.asc \
    && tar -xvf /tmp/hadoop.tar.gz -C /opt/ \
    && rm /tmp/hadoop.tar.gz*

RUN apt-get clean && rm -rf /var/lib/apt/lists/*

RUN ln -s /opt/hadoop-$HADOOP_VERSION/etc/hadoop /etc/hadoop
RUN cp /etc/hadoop/mapred-site.xml.template /etc/hadoop/mapred-site.xml
RUN mkdir /opt/hadoop-$HADOOP_VERSION/logs

RUN mkdir /hadoop-data

ENV HADOOP_PREFIX=/opt/hadoop-$HADOOP_VERSION
ENV HADOOP_CONF_DIR=/etc/hadoop
ENV MULTIHOMED_NETWORK=1

ENV USER=root
ENV PATH $HADOOP_PREFIX/bin/:$PATH

ADD base/entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
