### Задание

 • Настроить статическую конфигурацию (без DHCP) в Ubuntu через ip и netplan.
Настроить IP, маршрут по умолчанию и DNS-сервера (1.1.1.1 и 8.8.8.8).
Проверить работоспособность сети.

* cd /etc/netplan
* sudo nano 01-netnew.yaml
*   
network:
  version: 2
  renderer: networkd
  ethernets:
    enp0s3:
       dhcp4: no
       addresses: [192.168.1.100/24]
       routes:
         - to: default
           via: 192.168.0.124
       nameservers:
        addresses: [1.1.1.1, 8.8.8.8]
* sudo netplan apply
* ip a

• Настроить правила iptables для доступности сервисов на TCP-портах 22, 80 и 443.

*  sudo -i
* iptables-save > current.rulse
* iptables -A INPUT -p tcp --dport 22 -m state --state NEW,ESTABLISHED -j ACCEPT
* iptables -A INPUT -p tcp --dport 80 -m state --state NEW,ESTABLISHED -j ACCEPT
*  iptables -A INPUT -p tcp --dport 443 -m state --state NEW,ESTABLISHED -j ACCEPT
* iptables -A INPUT -i lo -j ACCEPT
* iptables -A INPUT -p icmp --icmp-type echo-request -j ACCEPT
* iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
* sudo iptables -L 

•* Также сервер должен иметь возможность устанавливать подключения к серверу обновлений.
* iptables -A OUTPUT -p tcp --dport 80 -j ACCEPT
Остальные подключения запретить.
* iptables -A INPUT -j DROP
* iptables -A OUTPUT -j DROP

• Запретить любой входящий трафик с IP 3.4.5.6.
* iptables -A INPUT -s 3.4.5.6 -j DROP


•* Запросы на порт 8090 перенаправлять на порт 80 (на этом же сервере).
* iptables -t nat -A PREROUTING -p tcp --dport 8090 -j REDIRECT --to-port 80


•* Разрешить подключение по SSH только из сети 192.168.0.0/24.
* iptables -N SSH-ALLOW
* iptables -A SSH-ALLOW -s 192.168.0.0/24 -p tcp --dport 22 -j ACCEPT
* iptables -A SSH-ALLOW -j DROP
* iptables -A INPUT -p tcp --dport 22 -j SSH-ALLOW