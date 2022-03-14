alias mainnet-on='export ETH_RPC_URL=https://xsc-datarpc1.xt.com'
alias testnet-on='export ETH_RPC_URL=https://testnet6.xtvip.top'

export ETH_PASSWORD=/dev/null
export ETH_GAS=7000000
export ETH_KEYSTORE=./keystore
export ETH_FROM=0x019afbcE1C05bE822c2Fd3D3d76eEaaf5ac90D0e

export LIB_DIR=/home/xdao/apps/xss-deploy-scripts/lib
export OUT_DIR=/home/xdao/apps/xss-deploy-scripts/out

testnet-on

export PATH=$PATH:/usr/bin

loadAddresses() {
    local keys
    ADDRESSES_FILE="/home/xdao/apps/xss-deploy-scripts/out/addresses.json"
    keys=$(jq -r "keys_unsorted[]" "$ADDRESSES_FILE")
    for KEY in $keys; do
        VALUE=$(jq -r ".$KEY" "$ADDRESSES_FILE")
        export "$KEY"="$VALUE"
    done
}

loadAddresses
