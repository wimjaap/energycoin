#!/bin/bash

ENERGYCOIN_DIR=~/.EnergyCoin
ENERGYCOIN_CONF=${ENERGYCOIN_DIR}/EnergyCoin.conf
NODELIST=$(curl -s "https://chainz.cryptoid.info/explorer/peers.nodes.dws?coin=enrg&subver=/EnergyCoin:1.6.1/" | sed -e 's/[[]\|[]]\|["]/''/g' | tr , '\n' | while read line; do echo addnode="$line"; done;)
BLOCKCHAIN=${ENERGYCOIN_DIR}/blk0001.dat

# If config doesn't exist, initialize with defaults for a full node
if [ ! -e "${ENERGYCOIN_CONF}" ]; then
echo "No config found, initializing config"
mkdir -p ${ENERGYCOIN_DIR}
cat >${ENERGYCOIN_CONF} <<EOF
server=1
rpcuser=${ENRG_RPCUSER:-enrg}
rpcpassword=${ENRG_RPCPASSWORD:-youshouldchangeme}
rpcallowip=${ENRG_RPCALLOWIP:-127.0.0.1}
disablewallet=${ENRG_DISABLEWALLET:-0}
staking=${ENRG_STAKING:-1}
txindex=${ENRG_TXINDEX:-1}
splitblkfiles=1
disabledebuglog=1
${NODELIST}
EOF
fi

if [ ! -f "${BLOCKCHAIN}" ]; then
mkdir -p ${ENERGYCOIN_DIR}/tmp
echo "Downloading bootstrap, please wait and grab a coffee.."
curl -o ${ENERGYCOIN_DIR}/tmp/EnergyCoinBlkChain.tgz https://www.wimjaap.nl/EnergyCoinBlkChain.tgz
echo "Extracting blockchain and moving to correct location."
cd ${ENERGYCOIN_DIR}/tmp
tar xzf EnergyCoinBlkChain.tgz
ls -al
mv -t ${ENERGYCOIN_DIR} ${ENERGYCOIN_DIR}/tmp/EnergyCoin/database ${ENERGYCOIN_DIR}/tmp/EnergyCoin/txleveldb ${ENERGYCOIN_DIR}/tmp/EnergyCoin/blk*
rm -r ${ENERGYCOIN_DIR}/tmp
fi
