# docker-bind
bind dns on Alpine Linux

# Run
```
docker run -it --name dns babim/bind
```

# environment value (with -e)
```
FORWARD1
FORWARD2
$DOMAIN
NS1
MAIL
POP3
IMAP
IMAP4
SMTP
```

# Default without -e
```
MAIL/IMAP/POP/NS1: 192.168.0.1
Forwarder: 8.8.8.8 8.8.4.4
Domain: example.lan
```
