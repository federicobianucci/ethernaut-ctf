// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

import "forge-std/Script.sol";
import "../src/21-Shop.sol";

contract ShopScript is Script {
    function setUp() public {}

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        address instanceAddress = 0x19fcD60E8b579D8Da00a9E770beF4b9B982ABb2B;
        vm.startBroadcast(deployerPrivateKey);
        new Shop(instanceAddress);
        vm.stopBroadcast();
    }
}
