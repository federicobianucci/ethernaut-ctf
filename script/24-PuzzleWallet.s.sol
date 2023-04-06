// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

import "forge-std/Script.sol";
import "../src/24-PuzzleWallet.sol";

contract PuzzleWalletScript is Script {
    function setUp() public {}

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        address instanceAddress = 0x46970b92871b615E42B9788da8c880BB138DB771;
        vm.startBroadcast(deployerPrivateKey);
        new PuzzleWallet(instanceAddress);
        vm.stopBroadcast();
    }
}
