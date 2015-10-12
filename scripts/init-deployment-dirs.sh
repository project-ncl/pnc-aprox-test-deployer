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

echo "Now, do the following:"
echo "1. Copy and change $DIR/ENV.prototype:"
echo ""
echo "  cp $DIR/ENV.prototype $DIR/ENV"
echo ""
echo "2. Adjust it to your desired deployment options"
echo "3. Execute the folowing:"
echo ""
echo "  cp $DIR/aprox-docker/systemd/aprox-server-novols.service /etc/systemd/system/aprox-server-<name>.service"
echo "  systemctl enable aprox-server-<name>"
echo ""
echo "4. Deploy AProx by calling:"
echo ""
echo "  $DIR/scripts/init-aprox --version=<initial-aprox-version>"
echo ""
