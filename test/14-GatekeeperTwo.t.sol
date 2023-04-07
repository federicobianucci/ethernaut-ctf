// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import "forge-std/Test.sol";
import "forge-std/console2.sol";

import "../src/14-GatekeeperTwo.sol";

contract GatekeeperTwoTest is Test {
    address constant instanceAddress = 0x715aF8dABb8fB244e2942717cb03a4fA9d53cff3;

    function setUp() public {}

    function test_enter() public {
        new GatekeeperTwo(instanceAddress);
    }

    function test_enter_with_deploy() public {
        GatekeeperTwoDeployer deployer = new GatekeeperTwoDeployer(instanceAddress);
        vm.prank(0x715aF8dABb8fB244e2942717cb03a4fA9d53cff3, 0x715aF8dABb8fB244e2942717cb03a4fA9d53cff3);
        deployer.deploy();
        assert(IGatekeeperTwo(instanceAddress).entrant() == 0x715aF8dABb8fB244e2942717cb03a4fA9d53cff3);
    }
}
