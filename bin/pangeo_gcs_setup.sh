#!/bin/bash
# Script to get GCS Jupyter pod in a state that can reliably run GCS Cloud management
# tools and run ASV benchmarks.

# Housecleaning stuff
# Retrieve some useful packages
chmod 0600 ~/.ssh/id_rsa
sudo apt update 
sudo apt -y install gnupg
sudo apt -y install lsb-release ssh-client less

export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)"
echo "deb http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list

# gcsfuse mount pangeo-data
export GCSFUSE_REPO=gcsfuse-`lsb_release -c -s`
echo "deb http://packages.cloud.google.com/apt $GCSFUSE_REPO main" | sudo tee /etc/apt/sources.list.d/gcsfuse.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
sudo apt update && sudo apt -y install google-cloud-sdk gcsfuse
/usr/bin/gcsfuse --implicit-dirs pangeo-data /gcs

conda update --yes conda
conda update --yes xarray
conda install --yes -c conda-forge xrft
# Hackish way to get latest xrft
cp /home/jovyan/dev/xrft/xrft/xrft.py /opt/conda/lib/python3.6/site-packages/xrft/xrft.py

