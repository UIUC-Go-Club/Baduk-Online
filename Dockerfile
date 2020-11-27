FROM ubuntu:18.04
RUN apt update && \
    apt upgrade -y && \
    apt install -y git && \
    apt install -y npm && \
    apt install -y nodejs && \
    apt install -y tmux
RUN git clone --recursive https://github.com/UIUC-Go/Baduk-Online.git \
    && sh Baduk-Online/install.sh \
    && sh Baduk-Online/config.sh
EXPOSE 7777
EXPOSE 3000

ENTRYPOINT ["/bin/sh","Baduk-Online/run.sh"]

#FROM node:7-alpine
#
#WORKDIR /app
#ADD . /app
#RUN npm install
#
#ENTRYPOINT ["./entrypoint.sh"]
#CMD ["start"]
