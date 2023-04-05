// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import "forge-std/Test.sol";
import "forge-std/console2.sol";

import "../src/19-AlienCodex.sol";

contract AlienCodexTest is Test {
    IAlienCodex public alienCodexInstance;
    AlienCodex public exploiter;

    function setUp() public {
        address instanceAddress = 0xAd31974A8936a01098a1eA7CB939Bf6CE142fD7A;
        alienCodexInstance = IAlienCodex(instanceAddress);
        exploiter = new AlienCodex(instanceAddress);
    }

    function test_attack() public {
        vm.prank(0xBF8641831D15c2701BA122981C3D7A6A2533ea48, 0xBF8641831D15c2701BA122981C3D7A6A2533ea48);
        exploiter.attack();
        assert(alienCodexInstance.owner() == 0xBF8641831D15c2701BA122981C3D7A6A2533ea48);
    }
}
