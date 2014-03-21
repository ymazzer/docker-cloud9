# DOCKER-VERSION 0.6.4

FROM stackbrew/ubuntu:13.10

RUN echo deb http://archive.ubuntu.com/ubuntu saucy main universe multiverse > /etc/apt/sources.list
RUN apt-get install -y --force-yes software-properties-common
RUN add-apt-repository -y ppa:chris-lea/node.js
RUN apt-get update
RUN apt-get install -y nodejs git
RUN git clone https://github.com/ajaxorg/cloud9.git
RUN cd /cloud9 && npm install

VOLUME ["/workspace"]

EXPOSE 3131
CMD ["/cloud9/bin/cloud9.sh", "-l", "0.0.0.0", "-w", "/workspace"]
