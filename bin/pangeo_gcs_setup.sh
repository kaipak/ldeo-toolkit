#!/bin/bash
# Script to get GCS Jupyter pod in a state that can reliably run GCS Cloud management
# tools and run ASV benchmarks.

sudo apt update && sudo apt -y install lsb-release ssh-client less

export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)"
echo "deb http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list

export GCSFUSE_REPO=gcsfuse-`lsb_release -c -s`
echo "deb http://packages.cloud.google.com/apt $GCSFUSE_REPO main" | sudo tee /etc/apt/sources.list.d/gcsfuse.list

curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
sudo apt update && sudo apt -y install google-cloud-sdk gcsfuse

conda update --yes conda
conda install --yes -c conda-forge seaborn xrft
# Hackish way to get latest xrft
cp /home/jovyan/dev/xrft/xrft/xrft.py /opt/conda/lib/python3.6/site-packages/xrft/xrft.py

chmod 0600 ~/.ssh/id_rsa