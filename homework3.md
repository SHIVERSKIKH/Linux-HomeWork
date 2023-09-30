### Задание

• Создать два произвольных файла.
ekaterina@gb:~$ touch file01
ekaterina@gb:~$ touch file02
ekaterina@gb:~$ ls -la

Первому присвоить права на чтение и запись для владельца и группы, только на чтение — для всех.
ekaterina@gb:~$ chmod 664 file01

Второму присвоить права на чтение и запись только для владельца. Сделать это в численном и символьном виде.
ekaterina@gb:~$ chmod u+rw file02

Назначить новых владельца и группу для директории целиком.
ekaterina@gb:~$ sudo chown -R gb1:gb1 lesson2


Управление пользователями:
* создать пользователя, используя утилиту useradd и adduser;
ekaterina@gb:~$ useradd gb2
ekaterina@gb:~$ sudo !!

ekaterina@gb:~$ sudo adduser gb3
Добавляется пользователь «gb3» ...
Добавляется новая группа «gb3» (1003) ...
Добавляется новый пользователь «gb3» (1003) в группу «gb3» ...
Домашний каталог «/home/gb3» уже существует. Не копируется из «/etc/skel».
Новый пароль:
НЕУДАЧНЫЙ ПАРОЛЬ: Пароль является палиндромом
Повторите ввод нового пароля:
passwd: пароль успешно обновлён
Изменение информации о пользователе gb3
Введите новое значение или нажмите ENTER для выбора значения по умолчанию
        Полное имя []: gb3
        Номер комнаты []: 3
        Рабочий телефон []: 3
        Домашний телефон []: 3
        Другое []: 3
Данная информация корректна? [Y/n] yes



* удалить пользователя, используя утилиту userdel.

ekaterina@gb:~$ userdel gb2
ekaterina@gb:~$ sudo !!

Управление группами:

создать группу с использованием утилит groupadd и addgroup;
ekaterina@gb:~$ groupadd group01
ekaterina@gb:~$ sudo !!
ekaterina@gb:~$ addgroup group02


попрактиковаться в смене групп у пользователей;

ekaterina@gb:~$ sudo usermod -a -G group02 gb3
ekaterina@gb:~$ sudo usermod -a -G group01 gb1

добавить пользователя в группу, не меняя основной;
ekaterina@gb:~$ sudo usermod -aG group02 gb1

• Создать пользователя с правами суперпользователя. Сделать так, чтобы sudo не требовал пароль для выполнения команд.
ekaterina@gb:~$ sudo adduser gb4
ekaterina@gb:~$ sudo usermod -aG sudo gb4
ekaterina@gb:~$ sudo visudo
gb4 ALL=(ALL) NOPASSWD: ALL

Дополнительные (необязательные) задания

• Используя дополнительные материалы, выдать одному из созданных пользователей право на выполнение ряда команд, требующих прав суперпользователя (команды выбираем на своё усмотрение).
ekaterina@gb:~$ sudo visudo
gb4  ALL=(ALL) NOPASSWD: /usr/bin/apt-get update, /usr/bin/apt-get upgrade


• Создать группу developer и нескольких пользователей, входящих в неё.
Создать директорию для совместной работы.
Сделать так, чтобы созданные одними пользователями файлы могли изменять другие пользователи этой группы.
ekaterina@gb:~$ sudo groupadd developer
ekaterina@gb:~$ sudo adduser devuser1
ekaterina@gb:~$ sudo adduser devuser2
ekaterina@gb:~$ sudo usermod -aG developer devuser1, devuser2
ekaterina@gb:~$ sudo mkdir /dev1
ekaterina@gb:~$ sudo chgrp developer /dev1
ekaterina@gb:~$ sudo chmod g+rwx /dev1
ekaterina@gb:~$ sudo chmod g+s /dev1
ekaterina@gb:~$ sudo chmod g+rwx /dev1



• Создать в директории для совместной работы поддиректорию для обмена файлами, но чтобы удалять файлы могли только их создатели.
ekaterina@gb:~$ cd /dev1
ekaterina@gb:/dev1$ sudo mkdir file_05
ekaterina@gb:/dev1$ sudo chgrp developer file_05
ekaterina@gb:/dev1$ sudo chmod g+rwx,o-rwx file_05
ekaterina@gb:/dev1$ sudo chmod +t file_05


• Создать директорию, в которой есть несколько файлов.
Сделать так, чтобы открыть файлы можно было, только зная имя файла, а через ls список файлов посмотреть было нельзя.
ekaterina@gb:/dev1$ cd ..
ekaterina@gb:/$ sudo mkdir der3
ekaterina@gb:/$ sudo touch der3/file_{1..6}
ekaterina@gb:/$ sudo chmod 700 der3
ekaterina@gb:/$ sudo chmod 600 der3/file_1 der3/file_2 der3/file_3 der3/file_4 der3/file_5 der3/file_6
ekaterina@gb:/$ sudo nano der3/file_1


