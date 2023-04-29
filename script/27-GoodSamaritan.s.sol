// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

import "forge-std/Script.sol";
import "../src/27-GoodSamaritan.sol";

contract GoodSamaritanScript is Script {
    function setUp() public {}

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        address instanceAddress = 0xB5cAa4F81BDc1240eB468C1bBBd1F6E7D07D0E94;
        vm.startBroadcast(deployerPrivateKey);
        new GoodSamaritan(instanceAddress);
        vm.stopBroadcast();
    }
}
