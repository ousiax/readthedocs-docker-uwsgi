FROM qqbuby/readthedocs
MAINTAINER qqbuby <qqbuby@gmail.com>

WORKDIR $RTD_REPO_DIR

COPY ./files/readthedocs.ini ./
RUN apt-get update && apt-get install -y --no-install-recommends \
        libpcre3-dev \
    && rm -rf /var/lib/apt/lists/* \
    && pip install uwsgi \
    && rm -rf ~/.cache /tmp/pip_build_* \
    && mkdir -p /var/log/readthedocs /var/run/readthedocs

EXPOSE 9527

CMD ["uwsgi", "--ini", "readthedocs.ini:dev"]
