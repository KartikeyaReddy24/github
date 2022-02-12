ARG baseimage=ubuntu:latest

FROM $baseimage

RUN apt update
RUN apt install python3 -y

RUN mkdir /sai

WORKDIR /sai

# WORKDIR /usr/app/src

# copy app.py ./

# CMD [ "python3", "./app.py"]