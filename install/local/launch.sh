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
echo ""
echo "#################################################"
echo ""

startPath=$(pwd)

if [ ! -d "$GOPATH/src/github.com/coralproject/shelf" ]; then
	echo "Getting github.com/coralproject/shelf"
	go get github.com/coralproject/shelf
else
	echo "Shelf found, no need to get it"
fi

mongod&
source $GOPATH/src/github.com/coralproject/shelf/config/localhost.cfg

echo "#####################"
echo "Building Corald"
cd $GOPATH/src/github.com/coralproject/shelf/cmd/corald
go install

echo "Building Sponge CLI"
cd $GOPATH/src/github.com/coralproject/shelf/cmd/sponge
go install

echo "Building Sponge Daemon"
cd $GOPATH/src/github.com/coralproject/shelf/cmd/sponged
go install

echo "Building Wire CLI"
cd $GOPATH/src/github.com/coralproject/shelf/cmd/wire
go install

echo "Building Xenia CLI"
cd $GOPATH/src/github.com/coralproject/shelf/cmd/xenia
go install

echo "Building Xenia Daemon"
cd $GOPATH/src/github.com/coralproject/shelf/cmd/xeniad
go install

echo "Building Coral Daemon"
cd $GOPATH/src/github.com/coralproject/shelf/cmd/corald
go install


echo "##################################"
echo "Launching Coral Platform Services."

lsof -i tcp:16180 | awk 'NR>1 {print $2}' | xargs kill
$GOPATH/bin/corald&
lsof -i tcp:16181 | awk 'NR>1 {print $2}' | xargs kill
$GOPATH/bin/sponged&
lsof -i tcp:16182 | awk 'NR>1 {print $2}' | xargs kill
$GOPATH/bin/xeniad&

cd $startPath

talkPlatform="../../library/coral"

echo ""
echo "##################################"
echo "Configuring the platform for Talk."
echo "##################################"
sponge pattern upsert -p $talkPlatform/patterns/
xenia relationship upsert -p $talkPlatform/relationships/
xenia view upsert -p $talkPlatform/views/
xenia query upsert -p $talkPlatform/querySets/
