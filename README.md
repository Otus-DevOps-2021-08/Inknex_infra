# Inknex_infra

## Подключение к VM внутри VPC
```
bastion_IP = 34.122.81.33
someinternalhost_IP = 10.128.0.4
```
### Флаг -J
Использовать фоаг **-J** консольной утилиты _ssh_ для "прыжков" по списку хостов.
```console
ssh -i ~/.ssh/user.key -A -J inknex@34.122.81.33 inknex@10.128.0.4
```
### Config
Создаем алиасы для **bastion** и **internal_instance**. Для **internal_instance** укзываем _ProxyJump_.
```
Host bastion
  User inknex
  HostName 34.122.81.33

Host internal_instance
  User inknex
  HostName 10.128.0.4
  ProxyJump bastion
```
### SSH Tunel
Создаем тунель на локальный порт
```console
ssh -L 8888:10.128.0.4:22 inknex@34.122.81.33 -N 
```
Подключаемся через проброшеный порт
```console
ssh inknex@127.0.0.1 -p 8888
```

### VPN
Адрес с установленным сертификатом https://34.122.81.33.sslip.io/
