FROM kilfu0701/hadoop-base:2.10.1-java8
MAINTAINER BoRu Su <kilfu0701@gmail.com>

HEALTHCHECK CMD curl -f http://localhost:8042/ || exit 1

ADD nodemanager/run.sh /run.sh
RUN chmod a+x /run.sh

EXPOSE 8042

CMD ["/run.sh"]
