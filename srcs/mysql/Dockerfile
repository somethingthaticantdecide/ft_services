FROM	alpine

RUN		apk update
RUN		apk add mariadb mariadb-client
RUN		mkdir -p /run/mysqld/

RUN		apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache

COPY	/srcs/telegraf.conf			/etc/telegraf/
COPY	/srcs/my.cnf			    /etc/
COPY	/srcs/start.sh				/
COPY	/srcs/wordpress.sql			/
COPY	/srcs/healthcheck.sh		/

EXPOSE	3306

ENTRYPOINT	sh start.sh
