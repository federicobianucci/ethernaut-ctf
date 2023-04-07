// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

import "forge-std/Script.sol";
import "../src/25-Motorbike.sol";

contract MotorbikeScript is Script {
    function setUp() public {}

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        address implementationAddress = 0x79D2Bc4Fa524915C50C8cA3916F4F060114beE1e;
        vm.startBroadcast(deployerPrivateKey);
        new Motorbike(implementationAddress);
        vm.stopBroadcast();
    }
}
