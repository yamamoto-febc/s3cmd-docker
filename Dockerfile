FROM alpine:3.4
MAINTAINER Kazumichi Yamamoto <yamamoto.febc@gmail.com>

RUN apk add --no-cache python py-pip py-setuptools git ca-certificates
RUN pip install python-dateutil

RUN git clone https://github.com/s3tools/s3cmd.git /opt/s3cmd
RUN ln -s /opt/s3cmd/s3cmd /usr/bin/s3cmd

ADD base_s3cfg /opt/base_s3cfg
ADD entrypoint.sh /opt/entrypoint.sh
RUN chmod 777 /opt/entrypoint.sh

WORKDIR /work
ENTRYPOINT ["/opt/entrypoint.sh"]
