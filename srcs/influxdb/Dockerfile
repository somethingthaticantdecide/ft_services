FROM alpine

RUN apk update && apk upgrade
RUN apk add influxdb

RUN apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache

COPY ./srcs/influxdb.conf 	/etc/influxdb.conf
COPY ./srcs/telegraf.conf 	/etc/telegraf.conf
COPY ./srcs/telegraf.conf 	/etc/telegraf/telegraf.conf
COPY ./srcs/start.sh 		/

EXPOSE 8086

ENTRYPOINT sh start.sh
