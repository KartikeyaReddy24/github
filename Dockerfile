#ARG baseimage=ubuntu:latest
#FROM $basimage

ARG baseimage=ubuntu
ARG version=latest
FROM ${baseimage}:${version}

RUN apt update
#RUN apt install httpd
#RUN apt install python3 -y

RUN apt install nginx -y
RUN apt install httpd

WORKDIR /var/www/html/
#RUN mkdir /sai
#WORKDIR /sai

copy elegant_website /var/www/html/

RUN cp -rvf elegant_website/* .

CMD ["/usr/sbin/httpd","-D","FOREGROUND"]

#CMD [“nginx”,”-g”,”daemon off;”]

EXPOSE 81

# copy app.py ./sai

#RUN zypper update --no-confirm --no-recommends \
 #   && zypper install --no-confirm --no-recommends git \
 #   && zypper clean --all

# WORKDIR /usr/app/src

# CMD [ "python3", "./app.py"]