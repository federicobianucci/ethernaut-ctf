// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

import "forge-std/Script.sol";
import "../src/13-GatekeeperOne.sol";

contract GatekeeperOneScript is Script {
    function setUp() public {}

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        address instanceAddress = 0x828d3D011f609fBca906582755A81f9c78Ec1613;
        vm.startBroadcast(deployerPrivateKey);
        new GatekeeperOne(instanceAddress);
        vm.stopBroadcast();
    }
}
