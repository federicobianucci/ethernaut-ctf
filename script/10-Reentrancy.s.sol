// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/10-Reentrancy.sol";

contract ReentrancyScript is Script {
    function setUp() public {}

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        address instanceAddress = 0xfBeC03b1c363EfedECDd1155099f797CCF8C53CB;
        vm.startBroadcast(deployerPrivateKey);
        new Reentrancy(instanceAddress);
        vm.stopBroadcast();
    }
}
