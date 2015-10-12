#!/bin/bash

git --version > /dev/null || echo "You must have git installed."
python -c 'import httplib2' > /dev/null || echo "You must have python-httplib2 installed"

DIR=$(dirname $(dirname $(realpath $0)))
echo "Initializing AProx directories in $DIR"

pushd $DIR
mkdir data etc logs storage
git clone https://github.com/commonjava/aprox-docker.git
popd

echo "$DIR now contains the following subdirectories:"
ls -1 $DIR

echo "Now, copy $DIR/ENV.prototype to $DIR/ENV."
echo "Next, adjust the $DIR/ENV file to match your desired deployment options."
echo "Then, to deploy AProx, call: $DIR/scripts/init-aprox --version=<initial-aprox-version>"
