// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

import "forge-std/Script.sol";
import "../src/29-Switch.sol";

contract SwitchScript is Script {
    function setUp() public {}

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        address instanceAddress = 0x82bca0160954A651344eA97f3c3B8B9a55f29572;
        vm.startBroadcast(deployerPrivateKey);
        new Switch(instanceAddress);
        vm.stopBroadcast();
    }
}
