#!/bin/bash
# Set up a mini conda environment and quickly get up and running in 
# a shared cluster environment. 
BASHRC="${HOME}/.bashrc"
NOW=`date +%Y-%m-%d.%H:%M:%S`
ENVYML="environment.yml_$NOW"

wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh

bash miniconda.sh -b -p ${HOME}/miniconda

if [ ! -z $(grep  "bash miniconda.sh -b -p $HOME/miniconda" "$BASHRC") ]
then
	continue
else
	echo "export PATH="$HOME/miniconda/bin:$PATH" >> $HOME/.bashrc
fi
