# Test infraestructure mutable

FROM nginx

MAINTAINER Gerardo Soto <gerardo.8.soto@gmail.com>

# Configuration of server Nginx
COPY nginx.conf /etc/nginx/nginx.conf
COPY hello-world.conf /etc/nginx/conf.d/hello-world.conf

# path to use our app
# mkdir -p : if already exist, ignore error
RUN mkdir -p /usr/share/nginx/html/hello

# copy our app
COPY index.html /usr/share/nginx/html/hello/index.html

# expose our app on a port
EXPOSE 80

