FROM babim/alpinebase

RUN apk add --no-cache bind

ADD entrypoint.sh /entrypoint.sh

EXPOSE 53/udp

RUN chmod +x /entrypoint.sh

VOLUME ["/etc/bind"]

ENTRYPOINT ["/entrypoint.sh"]
CMD ["named", "-g"]
