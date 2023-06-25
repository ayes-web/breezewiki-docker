FROM ubuntu:23.04

WORKDIR /app
EXPOSE 10416

RUN apt update -y && \
    apt install -y --no-install-recommends ca-certificates git racket && \
    apt autoclean -y && \
    apt autoremove -y
RUN git clone --depth=1 https://gitdab.com/cadence/breezewiki.git .
RUN raco pkg install --batch --auto --no-docs --skip-installed req-lib
RUN raco req -d

CMD [ "racket", "dist.rkt" ]