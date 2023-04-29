// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import "forge-std/Test.sol";
import "forge-std/console2.sol";
import "../src/29-Switch.sol";

contract SwitchTest is Test {
    address from = vm.envAddress("ETH_FROM");
    ISwitch switchInstance = ISwitch(0x82bca0160954A651344eA97f3c3B8B9a55f29572);
    Switch exploiter = new Switch(address(switchInstance));

    function setUp() public {}

    function test_attack() public {
        vm.startPrank(from, from);
        exploiter.attack();
    }
}
