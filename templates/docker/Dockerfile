FROM {{docker_images.java.name}}:{{docker_images.java.tag}}

RUN apk update && apk add -u curl python py-pip
RUN pip install supervisor

ENV MINECRAFT_VERSION {{version}}
ENV MINECRAFT_URL_ELEMENT 886945bfb2b978778c3a0288fd7fab09d315b25f

RUN adduser -DHs /sbin/nologin -u {{user_uid}} minecraft

RUN mkdir -p /data && \
    curl "https://launcher.mojang.com/mc/game/${MINECRAFT_VERSION}/server/${MINECRAFT_URL_ELEMENT}/server.jar" \
     -o /minecraft_server.jar && \
    chown -R minecraft:minecraft /data

COPY ./files/start /start
RUN	chmod +x /start

COPY ./files/supervisord.conf /etc/supervisord.conf

RUN touch /var/log/supervisord.log && chown minecraft:minecraft /var/log/supervisord.log && \
    touch /var/run/supervisord.pid && chown minecraft:minecraft /var/run/supervisord.pid

USER minecraft

EXPOSE 25565

VOLUME ["/data"]

ENTRYPOINT ["supervisord", "--nodaemon", "--configuration", "/etc/supervisord.conf"]
