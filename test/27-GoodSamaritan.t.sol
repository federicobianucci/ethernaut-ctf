// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import "forge-std/Test.sol";
import "forge-std/console2.sol";
import "../src/27-GoodSamaritan.sol";

contract DoubleEntryPointTest is Test {
    address from = vm.envAddress("ETH_FROM");
    IGoodSamaritan goodSamaritanInstance = IGoodSamaritan(0xB5cAa4F81BDc1240eB468C1bBBd1F6E7D07D0E94);
    ICoin coinInstance = goodSamaritanInstance.coin();

    GoodSamaritan exploiter = new GoodSamaritan(address(goodSamaritanInstance));

    function setUp() public {}

    function test_attack() public {
        vm.startPrank(from, from);
        exploiter.attack();
        require(coinInstance.balances(address(goodSamaritanInstance)) == 0, "Attack failed");
    }
}
