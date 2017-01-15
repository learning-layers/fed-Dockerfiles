FROM learninglayers/java8jce

MAINTAINER Dominik Renzel <renzel@dbis.rwth-aachen.de>

WORKDIR /opt

# Download & unpack las2peer service CI build from Jenkins
RUN wget http://layers.dbis.rwth-aachen.de/jenkins/job/las2peer-Demo-Service/lastSuccessfulBuild/artifact/*zip*/archive.zip \
&& unzip archive.zip \
&& rm archive.zip \
&& mv archive las2peer-federation

WORKDIR /opt/las2peer-federation

# expose las2peer bootstrap port to host
EXPOSE 9011/tcp
EXPOSE 9011/udp

# Start las2peer service and connect to bootstrap port
# make start script executable
RUN chmod +x ./bin/*.sh \
# TODO: make two following lines obsolete by earlier removal of startup params (in GitHub, Jenkins)
# for some reason, Jenkins delivers las2peer start scripts in DOS format, so d2u them...
&& apt-get install dos2unix -yq && dos2unix ./bin/*.sh \
# for some reason, Jenkins delivers start script with params "interactive", "uploadStartupDirectory" so remove these...
&& sed -i "s#interactive##g;s#uploadStartupDirectory##g" ./bin/connect_network.sh \
&& sed -i "s#interactive##g;s#uploadStartupDirectory##g" ./bin/start_network.sh \
&& cat ./bin/connect_network.sh \
&& cat ./bin/start_network.sh

COPY run.sh run.sh

CMD ["bash", "run.sh"]

