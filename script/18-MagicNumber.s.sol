// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

import "forge-std/Script.sol";
import "../src/18-MagicNumber.sol";

contract MagicNumberScript is Script {
    function setUp() public {}

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        address instanceAddress = 0x35af11A7b7c954AF16b1Ab26d84B9612eB84FBA9;
        vm.startBroadcast(deployerPrivateKey);
        new MagicNumber(instanceAddress);
        vm.stopBroadcast();
    }
}
