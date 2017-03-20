#!/usr/bin/env bash

FROM dataquestio/ubuntu-base

# Export env settings
ENV TERM=xterm
ENV LANG en_US.UTF-8

ADD requirements.txt /tmp/requirements.txt
ADD apt-packages.txt /tmp/apt-packages.txt

RUN apt-get update -y && apt-get install build-essential -y \
  && xargs -a /tmp/apt-packages.txt apt-get install --no-install-recommends -y \
  && apt-get clean \
  && pip install virtualenv \
  && /usr/local/bin/virtualenv /opt/ds --distribute --python=/usr/bin/python2.7 \
  && /opt/ds/bin/pip install -r /tmp/requirements.txt \
  && useradd --create-home --home-dir /home/ds --shell /bin/bash ds \
  && chown -R ds /opt/ds \
  && adduser ds sudo \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 

ADD run_ipython.sh /home/ds
RUN chmod +x /home/ds/run_ipython.sh \
  && chown ds /home/ds/run_ipython.sh \
  && mkdir -p /home/ds/.ptpython \
  && touch /home/ds/.ptpython/history \
  && mkdir -p /home/ds/notebooks \
  && chown -R ds /home/ds \
  && usermod -a -G sudo ds \
  && echo "ds ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

ADD ptpython/config.py /home/ds/.ptpython/config.py
ADD .bashrc.template /home/ds/.bashrc

EXPOSE 8888
USER ds
ENV HOME=/home/ds
ENV SHELL=/bin/bash
ENV USER=ds
VOLUME /home/ds/notebooks
WORKDIR /home/ds/notebooks

CMD ["/home/ds/run_ipython.sh"]
