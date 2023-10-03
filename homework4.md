### Задание
## • Подключить дополнительный репозиторий на выбор: Docker, Nginx, Oracle MySQL. Установить любой пакет из этого репозитория.

* for pkg in docker.io docker-doc docker-compose podman-docker containerd runc; do sudo apt-get remove $pkg; done
* sudo apt-get update
* sudo apt-get install ca-certificates curl gnupg
* --dearmor -o /etc/apt/keyrings/docker.gpg 
* sudo chmod a+r /etc/apt/keyrings/docker.gpg
* echo   "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" |   sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
* cat /etc/apt/sources.list.d/docker.list
* . /etc/os-release && echo "$VERSION_CODENAME"
* sudo apt-get update
* sudo apt-get install docker-ce docker-ce-cli containerd.io       docker-buildx-plugin docker-compose-plugin
* sudo docker run hello-world
* docker

## • Установить и удалить deb-пакет с помощью dpkg.

* wget https://download.virtualbox.org/virtualbox/7.0.10/virtualbox-7.0_7.0.10-158379~Ubuntu~jammy_amd64.deb

* sudo dpkg -i virtualbox-7.0_7.0.10-158379~Ubuntu~jammy_amd64.deb
* apt -f install
* sudo dpkg -r virtualbox-7.0

## • Установить и удалить snap-пакет.
* sudo snap search gimp
* sudo snap install gimp
* sudo snap remove gimp

## • Добавить задачу для выполнения каждые 3 минуты (создание директории, запись в файл).

* crontab -e
*  */3 * * * *  mkdir -p /var/backups/home.tgz /home/

## •* Подключить PPA-репозиторий на выбор. Установить из него пакет. Удалить PPA из системы.

* sudo add-apt-repository ppa:otto-kesselgulasch/gimp
* sudo apt-get update
* sudo apt-get install gimp
* sudo add-apt-repository --remove ppa:otto-kesselgulasch/gimp






