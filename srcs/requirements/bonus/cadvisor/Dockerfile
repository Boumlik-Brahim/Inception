FROM debian:buster

RUN apt-get -y update && apt-get -y install curl

RUN curl -L https://github.com/google/cadvisor/releases/download/v0.34.0/cadvisor -o /usr/local/bin/cadvisor

RUN chmod +x /usr/local/bin/cadvisor

CMD ["/usr/local/bin/cadvisor"]