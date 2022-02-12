#ARG baseimage=ubuntu:latest
#FROM $basimage

ARG baseimage=ubuntu
ARG version=latest
FROM ${baseimage}:${version}

RUN apt update
#RUN apt install httpd
#RUN apt install python3 -y

RUN apt install nginx -y
#RUN apt install -y httpd

#WORKDIR /var/www/html/
#RUN mkdir /sai
#WORKDIR /sai

copy elegant_website/index.html /var/www/html/

#RUN cp -rvf elegant_website/* .

#CMD ["/usr/sbin/httpd","-D","FOREGROUND"]

EXPOSE 81

CMD ["nginx","-g"","daemon off;"]



#copy app.py ./sai

#RUN zypper update --no-confirm --no-recommends \
 #   && zypper install --no-confirm --no-recommends git \
 #   && zypper clean --all

# WORKDIR /usr/app/src

#CMD ["python3", "./app.py"]