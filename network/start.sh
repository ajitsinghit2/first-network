#!/bin/bash

docker-compose -f docker-compose.yml down

# Remove old images
echo "REMOVE ALL OLD IMAGES"
docker images | grep "dev-" | awk '{print $3}' | xargs docker rmi -f

docker-compose -f docker-compose.yml up -d

# Wait for Hyperledger Fabric to start
sleep 10

# Create the channel
docker exec -e "CORE_PEER_LOCALMSPID=Org1MSP" -e "CORE_PEER_MSPCONFIGPATH=/etc/hyperledger/msp/users/Admin@org1.example.com/msp" peer0.org1.example.com peer channel create -o orderer.example.com:7050 -c mychannel -f /etc/hyperledger/configtx/channel.tx
# Join the channel
docker exec -e "CORE_PEER_LOCALMSPID=Org1MSP" -e "CORE_PEER_MSPCONFIGPATH=/etc/hyperledger/msp/users/Admin@org1.example.com/msp" peer0.org1.example.com peer channel join -b mychannel.block
