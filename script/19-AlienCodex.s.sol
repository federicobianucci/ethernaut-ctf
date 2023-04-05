// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

import "forge-std/Script.sol";
import "../src/19-AlienCodex.sol";

contract AlienCodexScript is Script {
    function setUp() public {}

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        address instanceAddress = 0xAd31974A8936a01098a1eA7CB939Bf6CE142fD7A;
        vm.startBroadcast(deployerPrivateKey);
        new AlienCodex(instanceAddress);
        vm.stopBroadcast();
    }
}
