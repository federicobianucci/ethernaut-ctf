// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/09-King.sol";

contract KingScript is Script {
    function setUp() public {}

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        address instanceAddress = 0xDE1ECa47bB594033183A70d7138a0Ac3Fc93a4b7;
        vm.startBroadcast(deployerPrivateKey);
        new King{value: 0.01 ether}(instanceAddress);
        vm.stopBroadcast();
    }
}
