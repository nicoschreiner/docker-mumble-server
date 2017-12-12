FROM phusion/baseimage:latest

LABEL maintainer="nico@nicoschreiner.de"

CMD ["/sbin/my_init"]

# install mumble-server
RUN add-apt-repository -y ppa:mumble/release && \
    apt-get update && apt-get install -y mumble-server

# cleanup APT
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# let baseimage's runit start mumble-server
RUN mkdir /etc/service/mumble-server
COPY run.sh /etc/service/mumble-server/run
RUN chmod 755 /etc/service/mumble-server/run

# other stuff
VOLUME "/data"
EXPOSE 64738 64738/udp
