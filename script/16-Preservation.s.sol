// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

import "forge-std/Script.sol";
import "../src/16-Preservation.sol";

contract PreservationScript is Script {
    function setUp() public {}

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        address instanceAddress = 0x86bdF83a567e801aceFD4ee64BEb97c74A9e7768;
        vm.startBroadcast(deployerPrivateKey);
        new Preservation(instanceAddress);
        vm.stopBroadcast();
    }
}
