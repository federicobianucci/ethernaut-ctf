// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import "forge-std/Test.sol";
import "forge-std/console2.sol";

import "../src/25-Motorbike.sol";

contract MotorbikeTest is Test {
    address from = vm.envAddress("ETH_FROM");
    Motorbike exploiter = new Motorbike(0x79D2Bc4Fa524915C50C8cA3916F4F060114beE1e);

    function setUp() public {}

    function test_attack() public {
        vm.startPrank(from, from);
        exploiter.attack();
    }
}
