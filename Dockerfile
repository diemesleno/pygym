FROM python:3.6.5-alpine3.7
LABEL author="Diemesleno Souza Carvalho <diemesleno@gmail.com>"

RUN apk update && apk add --no-cache \
        build-base \
        postgresql-dev \
        gcc \
        python3-dev \
        musl-dev \
        bash \
    && rm -rf /var/cache/apk/*

ENV INSTALL_PATH /usr/src/pygym
RUN mkdir -p $INSTALL_PATH

COPY .  /usr/src/pygym

WORKDIR $INSTALL_PATH

EXPOSE 8000

RUN pip install --upgrade pip pip

RUN pip install -r requirements.txt && rm -rf /root/.cache
