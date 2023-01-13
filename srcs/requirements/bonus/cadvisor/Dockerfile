FROM debian:buster

LABEL maintainer="BOUMLIK BRAHIM <boumlik01brahim@gmail.com>" Description="Cadvisor Docker image based on Debian 11"

RUN apt-get -y update && apt-get -y install curl dumb-init

RUN curl -L https://github.com/google/cadvisor/releases/download/v0.34.0/cadvisor -o /usr/local/bin/cadvisor

RUN chmod +x /usr/local/bin/cadvisor

ENTRYPOINT ["/usr/bin/dumb-init"]

CMD ["/usr/local/bin/cadvisor"]