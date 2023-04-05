// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

import "forge-std/Script.sol";
import "../src/14-GatekeeperTwo.sol";

contract GatekeeperTwoScript is Script {
    function setUp() public {}

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        address instanceAddress = 0x715aF8dABb8fB244e2942717cb03a4fA9d53cff3;
        vm.startBroadcast(deployerPrivateKey);
        new GatekeeperTwoDeployer(instanceAddress);
        vm.stopBroadcast();
    }
}
