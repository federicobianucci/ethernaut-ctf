# Ethernaut CTF

Ethernaut CTF solutions.

Levels that are not included here have been resolved directly on the browser console.

To get things more complicated I used a wallet to submit instances and another one for deploying contracts (don't want to expose the pk) :D

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
forge script script/03-CoinFlip.s.sol:CoinFlipScript --rpc-url $SEPOLIA_RPC_URL --broadcast --verify -vvvv
forge script script/04-Telephone.s.sol:TelephoneScript --rpc-url $SEPOLIA_RPC_URL --broadcast --verify -vvvv
forge script script/07-Force.s.sol:ForceScript --rpc-url $SEPOLIA_RPC_URL --broadcast --verify -vvvv
forge script script/09-King.s.sol:KingScript --rpc-url $SEPOLIA_RPC_URL --broadcast --verify -vvvv
forge script script/10-Reentrancy.s.sol:ReentrancyScript --rpc-url $SEPOLIA_RPC_URL --broadcast --verify -vvvv
forge script script/11-Elevator.s.sol:ElevatorScript --rpc-url $SEPOLIA_RPC_URL --broadcast --verify -vvvv
forge script script/13-GatekeeperOne.s.sol:GatekeeperOneScript --rpc-url $SEPOLIA_RPC_URL --broadcast --verify -vvvv
forge script script/14-GatekeeperTwo.s.sol:GatekeeperTwoScript --rpc-url $SEPOLIA_RPC_URL --broadcast --verify -vvvv
forge script script/15-NaughtCoin.s.sol:NaughtCoinScript --rpc-url $SEPOLIA_RPC_URL --broadcast --verify -vvvv
forge script script/16-Preservation.s.sol:PreservationScript --rpc-url $SEPOLIA_RPC_URL --broadcast --verify -vvvv
forge script script/17-Recover.s.sol:RecoverScript --rpc-url $SEPOLIA_RPC_URL --broadcast --verify -vvvv
forge script script/18-MagicNumber.s.sol:MagicNumberScript --rpc-url $SEPOLIA_RPC_URL --broadcast --verify -vvvv
forge script script/19-AlienCodex.s.sol:AlienCodexScript --rpc-url $SEPOLIA_RPC_URL --broadcast --verify -vvvv
forge script script/20-Denial.s.sol:DenialScript --rpc-url $SEPOLIA_RPC_URL --broadcast --verify -vvvv
forge script script/21-Shop.s.sol:ShopScript --rpc-url $SEPOLIA_RPC_URL --broadcast --verify -vvvv
forge script script/22-Dex.s.sol:DexScript --rpc-url $SEPOLIA_RPC_URL --broadcast --verify -vvvv
forge script script/23-DexTwo.s.sol:DexTwoScript --rpc-url $SEPOLIA_RPC_URL --broadcast --verify -vvvv
forge script script/24-PuzzleWallet.s.sol:PuzzleWalletScript --rpc-url $SEPOLIA_RPC_URL --broadcast --verify -vvvv
forge script script/25-Motorbike.s.sol:MotorbikeScript --rpc-url $SEPOLIA_RPC_URL --broadcast --verify -vvvv
```
### Test in a local Sepolia fork
```bash
forge test --match-path test/13-GatekeeperOne.t.sol --fork-url $SEPOLIA_RPC_URL -vvvv
forge test --match-path test/14-GatekeeperTwo.t.sol --fork-url $SEPOLIA_RPC_URL -vvvv
forge test --match-path test/15-NaughtCoin.t.sol --fork-url $SEPOLIA_RPC_URL -vvvv
forge test --match-path test/16-Preservation.t.sol --fork-url $SEPOLIA_RPC_URL -vvvv
forge test --match-path test/19-AlienCodex.t.sol --fork-url $SEPOLIA_RPC_URL -vvvv
forge test --match-path test/22-Dex.t.sol --fork-url $SEPOLIA_RPC_URL -vvvv
forge test --match-path test/23-DexTwo.t.sol --fork-url $SEPOLIA_RPC_URL -vvvv
forge test --match-path test/24-PuzzleWallet.t.sol --fork-url $SEPOLIA_RPC_URL -vvvv
forge test --match-path test/25-Motorbike.t.sol --fork-url $SEPOLIA_RPC_URL -vvvv
```
### Deploy with truffle dashboard
```bash
# signature does not work with foundry but you can use your wallet to choose the rpc
forge script script/<contract>.s.sol:<script> --rpc-url http://localhost:24012/rpc --broadcast -vvvv
```
