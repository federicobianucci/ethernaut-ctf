// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

import "forge-std/Script.sol";
import "../src/03-CoinFlip.sol";

contract CoinFlipScript is Script {
    function setUp() public {}

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        address instanceAddress = 0x0F179544b4865B26a0Fe8A424C3EC9342acc79B8;
        vm.startBroadcast(deployerPrivateKey);
        new CoinFlip(instanceAddress);
        vm.stopBroadcast();
    }
}
