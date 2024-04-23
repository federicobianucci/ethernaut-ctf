# Ethernaut CTF

Ethernaut CTF solutions.

Levels that are not included here have been resolved directly on the browser console.

## Links

[Ethernaut](https://ethernaut.openzeppelin.com/)

[Foundry](https://book.getfoundry.sh/)

[How to Create a Private RPC Endpoint with Alchemy](https://www.alchemy.com/overviews/private-rpc-endpoint)

[Getting an Etherscan API key](https://docs.etherscan.io/getting-started/viewing-api-usage-statistics)

## Commands

### Start
```bash
git clone git@github.com:federicobianucci/ethernaut-ctf.git
cd ethernaut-ctf
git submodule update --init --recursive
```

### Deploy to Sepolia
```bash
forge script script/<challenge>.s.sol:<script> --rpc-url $SEPOLIA_RPC_URL --broadcast --verify -vvvv
```
### Test in a local Sepolia fork
```bash
forge test --match-path test/<challenge>.t.sol --fork-url $SEPOLIA_RPC_URL -vvvv
```
### Deploy with truffle dashboard
```bash
# signature does not work with foundry but you can use your wallet to choose the rpc
forge script script/<challenge>.s.sol:<script> --rpc-url http://localhost:24012/rpc --broadcast -vvvv
```
