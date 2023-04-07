// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import "forge-std/Test.sol";
import "forge-std/console2.sol";

import "../src/16-Preservation.sol";

contract PreservationTest is Test {
    address from = vm.envAddress("ETH_FROM");
    IPreservation public preservationInstance;
    Preservation public exploiter;

    function setUp() public {
        address instanceAddress = 0x86bdF83a567e801aceFD4ee64BEb97c74A9e7768;
        preservationInstance = IPreservation(instanceAddress);
        exploiter = new Preservation(instanceAddress);
    }

    function test_attack() public {
        vm.prank(from, from);
        exploiter.attack();
        assert(preservationInstance.owner() == from);
    }
}
