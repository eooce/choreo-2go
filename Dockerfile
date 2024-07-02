FROM node:latest

WORKDIR /home/choreouser

EXPOSE 3000

COPY files/* /home/choreouser/

RUN apt-get update &&\
    apt install --only-upgrade linux-libc-dev &&\
    apt-get install -y iproute2 vim netcat-openbsd &&\
    addgroup --gid 10008 choreo &&\
    adduser --disabled-password  --no-create-home --uid 10008 --ingroup choreo choreouser &&\
    usermod -aG sudo choreouser &&\
    chmod +x index.js swith web server &&\
    npm install

CMD [ "node", "index.js" ]

USER 10008
