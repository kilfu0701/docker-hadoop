FROM kilfu0701/hadoop-base:3.3.2-java8
MAINTAINER BoRu Su <kilfu0701@gmail.com>

HEALTHCHECK CMD curl -f http://localhost:8088/ || exit 1

ADD resourcemanager/run.sh /run.sh
RUN chmod a+x /run.sh

EXPOSE 8088

CMD ["/run.sh"]
