ARG baseimage=ubuntu:latest

FROM $baseimage

RUN apt update
RUN apt install python3 -y

RUN mkdir /sai

copy app.py ./

WORKDIR /sai

# WORKDIR /usr/app/src

# CMD [ "python3", "./app.py"]