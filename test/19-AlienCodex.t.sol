// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import "forge-std/Test.sol";
import "forge-std/console2.sol";

import "../src/19-AlienCodex.sol";

contract AlienCodexTest is Test {
    address from = vm.envAddress("ETH_FROM");
    IAlienCodex public alienCodexInstance = IAlienCodex(0xAd31974A8936a01098a1eA7CB939Bf6CE142fD7A);
    AlienCodex public exploiter = new AlienCodex(0xAd31974A8936a01098a1eA7CB939Bf6CE142fD7A);

    function setUp() public {}

    function test_attack() public {
        vm.prank(from, from);
        exploiter.attack();
        assert(alienCodexInstance.owner() == from);
    }
}
