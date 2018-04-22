#!/bin/bash
# Brute force clean up ophaned Dask pods 
#

for pod in $(/usr/local/bin/kubectl get po --namespace pangeo -a | grep kai | grep dask | awk '{print$1}')
do
	/usr/local/bin/kubectl delete pod $pod --namespace pangeo
done


