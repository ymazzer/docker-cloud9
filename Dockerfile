# DOCKER-VERSION 0.6.4

FROM stackbrew/ubuntu:13.10

RUN ln -sf /bin/bash /bin/sh
RUN apt-get update
RUN apt-get install -y --force-yes build-essential make gcc libxml2-dev git-core curl nodejs npm git mercurial
RUN ln -s /usr/bin/nodejs /usr/bin/node
RUN git clone https://github.com/ajaxorg/cloud9.git
RUN cd /cloud9 && npm install
RUN cd /cloud9 && make ace
RUN cd /cloud9 && make worker

VOLUME ["/workspace"]

EXPOSE 3131
CMD ["/cloud9/bin/cloud9.sh", "-l", "0.0.0.0", "-w", "/workspace", "--username", $USER, "--password", $PASS]
