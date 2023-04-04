# Ethernaut CTF

## Links

[Ethernaut]https://ethernaut.openzeppelin.com/

[Foundry]https://book.getfoundry.sh/

[Getting an Etherscan API key]https://docs.etherscan.io/getting-started/viewing-api-usage-statistics

Levels that are not included here have been resolved directly on the browser console.

## Commands

### Deploy to Sepolia
```bash
forge script script/03-CoinFlip.s.sol:CoinFlipScript --rpc-url $SEPOLIA_RPC_URL --broadcast --verify -vvvv
forge script script/04-Telephone.s.sol:TelephoneScript --rpc-url $SEPOLIA_RPC_URL --broadcast --verify -vvvv
forge script script/07-Force.s.sol:ForceScript --rpc-url $SEPOLIA_RPC_URL --broadcast --verify -vvvv
forge script script/09-King.s.sol:KingScript --rpc-url $SEPOLIA_RPC_URL --broadcast --verify -vvvv
forge script script/10-Reentrancy.s.sol:ReentrancyScript --rpc-url $SEPOLIA_RPC_URL --broadcast --verify -vvvv
forge script script/11-Elevator.s.sol:ElevatorScript --rpc-url $SEPOLIA_RPC_URL --broadcast --verify -vvvv
forge script script/13-GatekeeperOne.s.sol:GatekeeperOneScript --rpc-url $SEPOLIA_RPC_URL --broadcast --verify -vvvv
forge script script/14-GatekeeperTwo.s.sol:GatekeeperTwoScript --rpc-url $SEPOLIA_RPC_URL --broadcast --verify -vvvv
forge script script/15-NaughtCoin.s.sol:NaughtCoinScript --rpc-url $SEPOLIA_RPC_URL --broadcast --verify -vvvv
```
### Test in a local Sepolia fork
```bash
forge test --match-path test/13-GatekeeperOneTest.t.sol --fork-url $SEPOLIA_RPC_URL -vvvv
forge test --match-path test/14-GatekeeperTwoTest.t.sol --fork-url $SEPOLIA_RPC_URL -vvvv
forge test --match-path test/15-NaughtCoinTest.t.sol --fork-url $SEPOLIA_RPC_URL -vvvv
```
### Deploy with truffle dashboard
```bash
# signature does not work with foundry but you can use your wallet to choose the rpc
forge script script/<contract>.s.sol:<script> --rpc-url http://localhost:24012/rpc --broadcast -vvvv
```
