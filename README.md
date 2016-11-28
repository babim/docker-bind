# docker-bind
bind dns on Alpine Linux

# Run
```
docker run -it --name dns -p 53:53/udp babim/bind
```

# environment value (with -e)
```
FORWARD1
FORWARD2
DOMAIN
NS1
MAIL
POP3
IMAP
IMAP4
SMTP
PIDFILE
```

# Default without -e
```
MAIL/IMAP/POP/NS1: 192.168.0.1
Forwarder: 8.8.8.8 8.8.4.4
Domain: example.lan
```
