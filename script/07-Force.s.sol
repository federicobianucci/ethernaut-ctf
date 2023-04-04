// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/07-Force.sol";

contract ForceScript is Script {
    function setUp() public {}

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        address instanceAddress = 0x81Ea91BA5cE462F958cDc1bEA705eF909cA0A571;
        vm.startBroadcast(deployerPrivateKey);
        new Force{value: 0.01 ether}(instanceAddress);
        vm.stopBroadcast();
    }
}
