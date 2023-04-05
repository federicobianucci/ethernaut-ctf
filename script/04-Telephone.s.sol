// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

import "forge-std/Script.sol";
import "../src/04-Telephone.sol";

contract TelephoneScript is Script {
    function setUp() public {}

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        address instanceAddress = 0x5d5efF8F78bdC212D50c5113a4a1A3136dc2951D;
        vm.startBroadcast(deployerPrivateKey);
        new Telephone(instanceAddress);
        vm.stopBroadcast();
    }
}
