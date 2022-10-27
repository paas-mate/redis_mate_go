FROM shoothzj/base:go AS build
COPY . /opt
WORKDIR /opt/pkg
RUN go build -o redis_mate .


FROM ttbb/redis:nake

COPY docker-build /opt/redis/mate

COPY --from=build /opt/pkg/redis_mate /opt/redis/mate/redis_mate

CMD ["/usr/bin/dumb-init", "bash", "-vx", "/opt/redis/mate/scripts/start.sh"]
