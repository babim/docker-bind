[![](https://images.microbadger.com/badges/image/babim/bind.svg)](https://microbadger.com/images/babim/bind "Get your own image badge on microbadger.com")[![](https://images.microbadger.com/badges/version/babim/bind.svg)](https://microbadger.com/images/babim/bind "Get your own version badge on microbadger.com")

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
