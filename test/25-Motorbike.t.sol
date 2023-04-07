// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import "forge-std/Test.sol";
import "forge-std/console2.sol";

import "../src/25-Motorbike.sol";

contract MotorbikeTest is Test {
    Motorbike exploiter;

    function setUp() public {
        address implementationAddress = 0x79D2Bc4Fa524915C50C8cA3916F4F060114beE1e;
        exploiter = new Motorbike(implementationAddress);
    }

    function test_attack() public {
        vm.startPrank(0xBF8641831D15c2701BA122981C3D7A6A2533ea48, 0xBF8641831D15c2701BA122981C3D7A6A2533ea48);
        exploiter.attack();
    }
}
