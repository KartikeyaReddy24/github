#ARG baseimage=ubuntu:latest
#FROM $basimage

ARG baseimage=ubuntu
ARG version=latest
FROM ${baseimage}:${version}

RUN apt update
RUN apt install python3 -y

RUN mkdir /sai

WORKDIR /sai

copy elegant_website ./sai 

# copy app.py ./sai

#RUN zypper update --no-confirm --no-recommends \
 #   && zypper install --no-confirm --no-recommends git \
 #   && zypper clean --all

# WORKDIR /usr/app/src

# CMD [ "python3", "./app.py"]