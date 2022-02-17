#!/bin/bash
# функция для подсчета среднего размера файла в директории;
# путь к директории передаётся параметром;
# при подсчете исключены подиректории и символьные ссылки;
average_file_size (){

if [ -d $1 ]; then
        local sum=0
        local sum1=0
        local number=0
        local average_size=0
        for file in $1/*; do
            if [ -f $file ]; then
                number=$(( $number+1 ))
                sum1=$(stat -c %s $file)
                sum=$(( $sum1+$sum ))
            fi
        done
    echo -e
    average_size=$(( $sum/$number ))
    echo "Число файлов в директории=$number"
    echo "Средний размер файла в директории=$average_size байт"
    echo -e
else echo Ошибка Директории не существует
fi
}
#average_file_size /home/buravtsov/netology/scripts
#average_file_size /etc
average_file_size /usr/bin