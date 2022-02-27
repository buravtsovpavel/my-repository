#!/bin/bash
#полный бекап
date
# Папка, куда будем складывать архивы
syst_dir=/backup/
# Имя сервера, который архивируем
srv_name=vm-debian-1
# Адрес сервера, который архивируем
srv_ip=51.250.12.176
# Пользователь rsync на сервере, который архивируем
srv_user=backup
# Ресурс на сервере для бэкапа
srv_dir=data
echo "Start backup ${srv_name}"
password_file='/etc/rsyncd.scrt'

# Создаем папку для полных бэкапов
mkdir -p ${syst_dir}/`date +%Y-%m-%d`/
# Запускаем непосредственно бэкап с параметрами
/usr/bin/rsync -avz --progress --delete --password-file=$password_file ${srv_user}@${srv_ip}::${srv_dir} ${syst_dir}/`date +%Y-%m-%d`/

date
echo "Finish backup ${srv_name}"