# from base image node
ARG NODE_VERSION=8.11-slim
FROM node:$NODE_VERSION

LABEL "about"="This file is just am example to demonstarte the LABEL"

ENV workdirectory /home/Prashanth

RUN mkdir /dockerexample
VOLUME /dockerexample

COPY package.json .

RUN ls -ll &&\
    npm install

RUN useradd Prashanth &&\
    mkdir -p $workdirectory &&\
    chown Prashanth $workdirectory
    
USER Prashanth
WORKDIR $workdirectory

ADD index.js .

RUN ls -l

EXPOSE 3070

# command executable and version
ENTRYPOINT ["node"]