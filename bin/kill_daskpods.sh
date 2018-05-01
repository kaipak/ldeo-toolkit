#!/bin/bash
# Brute force clean up ophaned Dask pods 
#

OPTIND=1

usage() { echo "Usage: $0 [-p <nprocs>] [-m <memory-limit>]" 1>&2;
      exit 1; }

user=""

while getopts "u:U:" opt; do
    case "$opt" in
      u|U) user=$OPTARG
     ;;
    esac
done

echo "$user"

if [[ -z "$user" ]]; then
    echo "Username required."
    exit 1
fi

shift $((OPTIND-1))

[ "$1" = "--" ] && shift


for pod in $(/usr/local/bin/kubectl get po --namespace pangeo -a | grep $user | grep dask | awk '{print$1}')
do
	/usr/local/bin/kubectl delete pod $pod --namespace pangeo
done


