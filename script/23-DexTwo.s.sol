// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

import "forge-std/Script.sol";
import "../src/23-DexTwo.sol";

contract DexTwoScript is Script {
    function setUp() public {}

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        address instanceAddress = 0xFf1d25EB895897a536c1b6b794E3110A787FB2d0;
        vm.startBroadcast(deployerPrivateKey);
        new DexTwo(instanceAddress);
        vm.stopBroadcast();
    }
}
