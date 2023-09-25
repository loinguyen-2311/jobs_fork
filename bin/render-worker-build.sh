#!/usr/bin/env bash
# exit on error
set -o errexit

mkdir -p /opt/render/project/.render
STORAGE_DIR=/opt/render/project/.render

if [[ ! -d $STORAGE_DIR/jdk ]]; then
  echo "...Downloading jdk"

  mkdir -p $STORAGE_DIR/jdk
  cd $STORAGE_DIR/jdk

  wget https://download.java.net/java/GA/jdk11/9/GPL/openjdk-11.0.2_linux-x64_bin.tar.gz --no-check-certificate
  tar xvzf openjdk-11.0.2_linux-x64_bin.tar.gz
  rm -rf openjdk-11.0.2_linux-x64_bin.tar.gz

  cd $HOME/project/src
fi

bundle install