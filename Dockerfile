FROM ubuntu:latest

RUN apt update
RUN apt install python3 -y

WORKDIR /usr/app/src

copy app.py ./

CMD [ "python3", "./app.py"]