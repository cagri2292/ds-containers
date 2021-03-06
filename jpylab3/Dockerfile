#!/usr/bin/env bash

FROM docker.io/phusion/baseimage

# Export env settings
ENV TERM=xterm
ENV LANG en_US.UTF-8
ENV USER=jpy3
ARG UID="1000"
ARG GID="1000"

ADD pre_requirements.txt /tmp/pre_requirements.txt
ADD requirements.txt /tmp/requirements.txt
ADD apt-packages.txt /tmp/apt-packages.txt

RUN groupadd --gid "$GID" "${USER}" && \
    useradd \
      --uid "$UID" \
      --gid "$GID" \
      --create-home \
      --home-dir /home/jpy3 \
      --shell /bin/bash \
      ${USER}

RUN apt-get update -y && apt-get install build-essential -y \
  && xargs -a /tmp/apt-packages.txt apt-get install --no-install-recommends -y \
  && apt-get clean \
  && pip install virtualenv \
  && /usr/local/bin/virtualenv /opt/jpy3 --distribute --python=/usr/bin/python3 \
  && /opt/jpy3/bin/pip install -U pip setuptools \
  && /opt/jpy3/bin/pip install -r /tmp/pre_requirements.txt \
  && /opt/jpy3/bin/pip install -r /tmp/requirements.txt \
  && /opt/jpy3/bin/pip install http://download.pytorch.org/whl/cu80/torch-0.3.1-cp35-cp35m-linux_x86_64.whl \
  && /opt/jpy3/bin/pip install torchvision \
  && /opt/jpy3/bin/pip install pyro-ppl \
  && /opt/jpy3/bin/pip install --upgrade tfp-nightly \
  && chown -R jpy3 /opt/jpy3 \
  && adduser jpy3 sudo \
  && /opt/jpy3/bin/jupyter serverextension enable --sys-prefix --py jupyterlab \
  && /opt/jpy3/bin/jupyter nbextension enable --py --sys-prefix widgetsnbextension \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 

ADD services/run_ipython.sh /home/jpy3
ADD ssl /home/jpy3/.ssl
RUN chmod +x /home/jpy3/run_ipython.sh \
  && chown jpy3 /home/jpy3/run_ipython.sh \
  && mkdir -p /home/jpy3/.ptpython \
  && mkdir -p /home/jpy3/.jupyter \
  && mkdir -p /home/jpy3/notebooks \
  && chown -R jpy3 /home/jpy3 \
  && usermod -a -G sudo jpy3 \
  && echo "jpy3 ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

ADD jupyter/jupyter_notebook_config.py /home/jpy3/.jupyter/jupyter_notebook_config.py
ADD .bashrc.template /home/jpy3/.bashrc

 #Jpy service
#RUN mkdir -p /etc/service/jpy
#ADD services/run_ipython.sh /etc/service/jpy/run
#RUN chmod a+x /etc/service/jpy/run

 #tensorboard service
#RUN mkdir -p /etc/service/tfb
#ADD services/run_tensorboard.sh /etc/service/tfb/run
#RUN chmod a+x /etc/service/tfb/run

EXPOSE 8888
EXPOSE 6006
USER jpy3
ENV HOME=/home/jpy3
ENV SHELL=/bin/bash
ENV USER=jpy3
VOLUME /home/jpy3/notebooks
WORKDIR /home/jpy3/notebooks

CMD ["/home/jpy3/run_ipython.sh"]
