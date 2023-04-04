// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/11-Elevator.sol";

contract ElevatorScript is Script {
    function setUp() public {}

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        address instanceAddress = 0xAeD84dBF5931A1652409F4CD74E1730f8B49dED7;
        vm.startBroadcast(deployerPrivateKey);
        new Elevator(instanceAddress);
        vm.stopBroadcast();
    }
}
