#! /bin/bash


mysqldump --defaults-extra-file=/etc/mysql/conf.d/mysqldump.cnf suleymanakturkdb > bck2-$(date +%T-%Y-%m-%d).sql


if [ $? -eq 0 ]; then
  echo "Backup Dosyasi Ektedir" | mail -s "Mysql Backup Basarili Bir Sekilde Alinmistir" -A bck2-$(date +%T-%Y-%m-%d).sql akturksuleyman47@gmail.com
else
  echo "Yedekleme sirasinda hata olustu. Zaman: `date +%T-%Y-%M-%d`"  | mail -s "Yedekleme sirasinda hata olustu." akturksuleyman47@gmail.com
  rm  bck2-$(date +%T-%Y-%m-%d).sql
fi
