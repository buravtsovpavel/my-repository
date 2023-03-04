####Цель домашнего задания
####Научиться обновлять ядро в ОС Linux. Получение навыков работы с Vagrant, Packer и публикацией готовых образов в Vagrant Cloud. 


---


####Описание домашнего задания
1. Обновить ядро ОС из репозитория ELRepo
2. Создать Vagrant box c помощью Packer
3. Загрузить Vagrant box в Vagrant Cloud


---
**1. Обновить ядро ОС из репозитория ELRepo**

обновление ядра из elrepo прошло гладко, всё по методичке

![версия ядра после перезагрузки](https://github.com/buravtsovpavel/my-repository/blob/main/1_1.jpg)









"disk_size": "20480"

   "iso_urls": [
          "CentOS-Stream-8-x86_64-20220603-boot.iso", 
          "http://mirrors.nipa.cloud/centos/8-stream/isos/x86_64/CentOS-Stream-8-x86_64-20220603-boot.iso"
          ],

"ssh_timeout": "120m",

"vboxmanage": [
                ["modifyvm",
            "{{.Name}}",
            "--nat-localhostreachable1", "on"
          ]  
        ],



закоментировал #authconfig --enableshadow --passalgo=sha512

поправил дефис в firewall --disabled


# Выбираем набор пакетов которые нужно установить
%packages --nocore --excludedocs
@^minimal-environment
yum
yum-utils
sudo
openssh
openssh-server
openssh-clients
sshpass
qemu-kvm-block-ssh
%end


# Добавляем пользователя vagrant в sudoers
%post
echo "# Allow vagrant to run any commands anywhere" >> /etc/sudoers
echo "vagrant   ALL=(ALL)   NOPASSWD: ALL" >> /etc/sudoers
%end

