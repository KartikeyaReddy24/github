#ARG baseimage=ubuntu:latest
#FROM $basimage

ARG baseimage=ubuntu
ARG version=latest
FROM ${baseimage}:${version}

RUN apt update
#RUN apt install httpd
#RUN apt install python3 -y

FROM nginx:latest

RUN mkdir /sai

WORKDIR /sai

copy elegant_website ./sai 

EXPOSE 81

# copy app.py ./sai

#RUN zypper update --no-confirm --no-recommends \
 #   && zypper install --no-confirm --no-recommends git \
 #   && zypper clean --all

# WORKDIR /usr/app/src

# CMD [ "python3", "./app.py"]