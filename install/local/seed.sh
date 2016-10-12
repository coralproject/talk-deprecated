#!/bin/bash

echo "#################################################"
echo "Prototypical launcher the Coral Platform services"
echo "#################################################"
echo ""
echo "Repo: https://github.com/coralproject/shelf"
echo ""
echo "Requirements:"
echo "GOPATH must be set"
echo "mongod must be installed"
echo "xeniad, sponged, and corald must be running"
echo ""
echo "#################################################"
echo ""

talkPlatform="../../library/coral"

echo ""
echo "##################################"
echo "Upserting Items into the platform for Talk."
echo "##################################"
sponge item upsert -p $talkPlatform/items/
