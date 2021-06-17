FROM	alpine

RUN		apk update
RUN		apk add wget
RUN		apk add php7 php7-fpm php7-mysqli php7-mbstring php7-json php7-session

RUN		apk add --no-cache nginx openssl php7-common php7-iconv php7-gd php7-curl php7-xml php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom
RUN		rm -f /etc/nginx/conf.d/default.conf

RUN		wget https://files.phpmyadmin.net/phpMyAdmin/4.9.2/phpMyAdmin-4.9.2-all-languages.tar.gz
RUN		tar -xzvf phpMyAdmin-4.9.2-all-languages.tar.gz
RUN		rm -rf phpMyAdmin-4.9.2-all-languages.tar.gz

RUN		mkdir /www/
RUN		mv phpMyAdmin-4.9.2-all-languages /www/
RUN		mv /www/phpMyAdmin-4.9.2-all-languages /www/phpmyadmin

RUN		apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache
RUN		mkdir -p /www /etc/telegraf

COPY	/srcs/telegraf.conf			/etc/telegraf/
COPY	/srcs/config.inc.php		/www/phpmyadmin/
COPY	/srcs/nginx.conf			/etc/nginx/conf.d/default.conf
COPY	/srcs/start.sh				/

EXPOSE	5000

ENTRYPOINT sh start.sh