# Установка

## zsh

В файле конфигурации указываем следующий код:

```
source /path/to/folder/index.bash
```

Затем применяем конфигурационный файл:

```
source /path/to/folder/.zshrc
```

# Работа с командой

## Создание соединения

Для создания соединения введите команду "o2_ssh" без параметров:

```
o2_ssh
Do you want to use file? (y/n):
```

Тут следует выбор: "хотите ли вы использовать файл?"(поддерживается sftp-config.json).

### 1. Соединение из файла:

```
Do you want to use file? (y/n): y
Where is the file:
```

Укажите директорию в которой лежит файл:

```
/path/to/project/
```

### 2. Ручное соединение:

```
Do you want to use file? (y/n): n
```

Здесь следует ввести параметры соединения:

```
Set username:
```

Имя пользователя на удаленной машине.

```
Set host:
```

ip или host удаленного сервера.

```
Set password:
```

Пароль. Если оставить пустым, то будет соединение через id_rsa.

```
Set port:
```

Порт для соединения. Если соединение через стандартный порт, то поле оставить пустым.

```
Set path:
```

Путь для редиректа в нужную папку сразу после входа. Необязательный параметр.

## Сохранение соединения

```
Do you want to save? (y/n):
```

Если вы хотите сохранить соединение для повторного использования - введите Y, иначе - вы просто соединитесь с сервером.

```
Do you want to save? (y/n): y
Set name (a-zA-Z0-9_):
```

Введите название соединения из доступных символов.

## Соединение по существующей конфигурации

Автоподстановкой можно выбрать существующее соединение:

```
o2_ssh testConnection
```

## Удаление соединения

Используйте ключ -d и, с помощью автоподстановки, выберите соединение:

```
o2_ssh -d testConnection
You are sure? (y/n):
```