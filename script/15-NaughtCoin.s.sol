// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/15-NaughtCoin.sol";

contract NaughtCoinScript is Script {
    function setUp() public {}

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        address instanceAddress = 0x4971cC3759Def60F44A31548d2eabeaF4730C455;
        vm.startBroadcast(deployerPrivateKey);
        new NaughtCoin(instanceAddress);
        vm.stopBroadcast();
    }
}
