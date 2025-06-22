FROM ubuntu
RUN apt update && apt install ssmtp -y && apt install mailutils -y && apt install mysql-client -y  && apt install cron -y

COPY ssmtpconf.sh /
RUN chmod +x /ssmtpconf.sh

COPY backup.sh /
RUN chmod +x backup.sh

COPY mysqldump.cnf /etc/mysql/conf.d


COPY backupcron /tmp/mycron
RUN crontab /tmp/mycron

RUN touch /var/log/cron.log

CMD ["bash", "-c", "cron && /ssmtpconf.sh && tail -f /dev/null"]
#CMD ["/bin/bash", "-c", "/conf.sh && tail -f /dev/null"]


