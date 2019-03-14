#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Clean the keystore
rm -rf ./hfc-key-store

cd $DIR

# Launch network; create channel and join peer to channel
cd ../network
bash ./teardown.sh
