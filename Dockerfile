FROM ubuntu:14.04 as build

WORKDIR /tmp/rtmp

COPY ./app /tmp/rtmp/app

RUN mkdir -p /tmp/rtmp \
  && apt-get update -y \
  && apt-get install -y build-essential libpcre3 libpcre3-dev libssl-dev \
  && apt-get install -y wget unzip \
  && wget http://nginx.org/download/nginx-1.13.1.tar.gz \
  && wget https://github.com/arut/nginx-rtmp-module/archive/v1.2.1.zip \
  && tar -zxvf nginx-1.13.1.tar.gz \
  && unzip v1.2.1.zip \
  && cd nginx-1.13.1 \
  && ./configure --with-http_ssl_module --add-module=../nginx-rtmp-module-1.2.1 \
  && make \
  && make install \
  && cp /tmp/rtmp/app/nginx.conf /usr/local/nginx/conf/nginx.conf

FROM ubuntu:14.04

COPY --from=build /usr/local/nginx /usr/local/nginx

CMD ["/usr/local/nginx/sbin/nginx", "-g", "daemon off;"]
