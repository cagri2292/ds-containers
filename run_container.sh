#!/usr/bin/env bash

usage() { echo "Usage: $0 [-d <data dir>] [-n <name>] [-p <port num>]" 1>&2; exit 1; }

while getopts ":d:n:p:" o; do
    case "${o}" in
        d)
            d=${OPTARG}
            ;;
        n)
            n=${OPTARG}
            ;;
        p)
            p=${OPTARG}
            ;;
        *)
            usage
            ;;
    esac
done
shift $((OPTIND-1))

FOLDER="$d/$n/data"
mkdir -p $FOLDER

CONTAINER=`docker run -d -p $p:8888 -v $FOLDER:/home/ds/notebooks dataquestio/python2-starter --name $n`
echo $CONTAINER
