// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

import "forge-std/Script.sol";
import "../src/22-Dex.sol";

contract DexScript is Script {
    function setUp() public {}

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        address instanceAddress = 0x7e00c95Bc3FACC8a12c387B1Aa31062a07449406;
        vm.startBroadcast(deployerPrivateKey);
        new Dex(instanceAddress);
        vm.stopBroadcast();
    }
}
