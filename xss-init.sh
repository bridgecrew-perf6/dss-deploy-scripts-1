alias mainnet-on='export ETH_RPC_URL=https://xsc-datarpc1.xt.com'
alias testnet-on='export ETH_RPC_URL=http://localhost:30080'

unset all_proxy ALL_PROXY

export ETH_PASSWORD=./keystore/password
export ETH_GAS=7000000
export ETH_KEYSTORE=./keystore
export ETH_FROM=0x019afbcE1C05bE822c2Fd3D3d76eEaaf5ac90D0e

export LIB_DIR=`pwd`/lib
export OUT_DIR=`pwd`/out

testnet-on

export TESTNET_PORT=30080
export PATH=$PATH:/usr/bin

loadAddresses() {
  local keys
  ADDRESSES_FILE="${OUT_DIR}/addresses.json"
  if [ -f "$ADDRESSES_FILE" ]; then
    keys=$(jq -r "keys_unsorted[]" "$ADDRESSES_FILE")
    for KEY in $keys; do
      VALUE=$(jq -r ".$KEY" "$ADDRESSES_FILE")
      export "$KEY"="$VALUE"
    done
  fi
}

loadAddresses

