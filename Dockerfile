FROM babim/alpinebase

## alpine linux
RUN apk add --no-cache wget bash && cd / && wget --no-check-certificate https://raw.githubusercontent.com/babim/docker-tag-options/master/z%20SCRIPT%20AUTO/option.sh && \
    chmod 755 /option.sh && apk del wget
    
RUN apk add --no-cache bind

ADD entrypoint.sh /entrypoint.sh

EXPOSE 53/udp

RUN chmod +x /entrypoint.sh

VOLUME ["/etc/bind"]

ENTRYPOINT ["/entrypoint.sh"]
CMD ["named", "-g"]
