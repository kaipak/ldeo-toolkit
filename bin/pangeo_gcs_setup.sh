#!/bin/bash
# Script to get GCS Jupyter pod in a state that can reliably run GCS Cloud management
# tools and run ASV benchmarks.

sudo apt update && sudo apt -y install lsb-release

export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)"
echo "deb http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
sudo apt update && sudo apt -y install google-cloud-sdk

conda update --yes conda
