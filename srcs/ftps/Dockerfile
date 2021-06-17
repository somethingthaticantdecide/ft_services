FROM	alpine

RUN		apk update && apk add vsftpd openssl
RUN		apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache
RUN		echo "root:password" | chpasswd
RUN		openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj "/C=RU/ST=Russia/L=Kazan/O=42 School/OU=jmontagu/CN=127.0.0.1" -keyout /etc/ssl/private/vsftpd.key -out /etc/ssl/certs/vsftpd.crt

COPY	/srcs/telegraf.conf			/etc/telegraf/
COPY	/srcs/vsftpd.conf			/etc/vsftpd
COPY	/srcs/start.sh				/

EXPOSE	21 30021

ENTRYPOINT	sh start.sh
