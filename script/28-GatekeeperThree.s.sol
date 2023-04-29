// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

import "forge-std/Script.sol";
import "../src/28-GatekeeperThree.sol";

contract GatekeeperThreeScript is Script {
    function setUp() public {}

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        address instanceAddress = 0x70F28D714De9515Ec378eCAF523ADf3256ee7797;
        vm.startBroadcast(deployerPrivateKey);
        new GatekeeperThree{value: 0.002 ether}(instanceAddress);
        vm.stopBroadcast();
    }
}
