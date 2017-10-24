#!/bin/bash
# Set up a mini conda environment and quickly get up and running in 
# a shared cluster environment. 
BASHRC="${HOME}/.bashrc"
NOW=`date +%Y-%m-%d.%H:%M:%S`
ENVYML="environment-xmitgcm.yml"

wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh

bash miniconda.sh -b -p ${HOME}/miniconda

if [ ! -z $(grep  "export PATH=$HOME/miniconda/bin:$PATH" "$BASHRC") ]
then
	echo "export PATH=$HOME/miniconda/bin:$PATH already in PATH"
else
	echo "export PATH=$HOME/miniconda/bin:$PATH" >> $HOME/.bashrc
fi

# Create xmitgcm environment
wget https://git.io/vdjiV -O $ENVYML
conda env create --file $ENVYML
rm $ENVYML
