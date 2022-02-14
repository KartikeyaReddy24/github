# CENTOS BASED
#small changes

## changes made

ARG baseimage=centos
ARG version=7
FROM ${baseimage}:${version}

RUN yum install -y httpd \
 zip \
 unzip

ADD https://www.free-css.com/assets/files/free-css-templates/download/page275/elegant.zip /var/www/html
WORKDIR /var/www/html
RUN unzip elegant.zip
RUN cp elegant/* .
RUN rm -rf elegant elegant.zip
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80









# UBUNTU BASED

#ARG baseimage=ubuntu:latest
#FROM $basimage

#ARG baseimage=ubuntu
#ARG version=latest
#FROM ${baseimage}:${version}

#RUN apt update
#RUN apt install httpd
#RUN apt install python3 -y

#RUN apt install nginx -y
#RUN apt install -y httpd

#WORKDIR /var/www/html/
#RUN mkdir /sai
#WORKDIR /sai

#copy elegant_website/index.html /var/www/html/


#copy elegant_website /sai

#small changes

#few more changes

#RUN cp -rvf elegant_website/* .

#CMD ["/usr/sbin/httpd","-D","FOREGROUND"]

#EXPOSE 81

#CMD ["nginx","-g"","daemon off;"]



#copy app.py ./sai

#RUN zypper update --no-confirm --no-recommends \
 #   && zypper install --no-confirm --no-recommends git \
 #   && zypper clean --all

# WORKDIR /usr/app/src

#CMD ["python3", "./app.py"]