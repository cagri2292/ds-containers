#! /bin/bash

exec /sbin/setuser jpy3 /opt/jpy3/bin/jupyter lab --no-browser --port 8888 --ip=0.0.0.0 $*
