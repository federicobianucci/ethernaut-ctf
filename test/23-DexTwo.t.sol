// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import "forge-std/Test.sol";
import "forge-std/console2.sol";
import "openzeppelin-contracts/contracts/token/ERC20/IERC20.sol";

import "../src/23-DexTwo.sol";

contract DexTwoTest is Test {
    address from = vm.envAddress("ETH_FROM");
    IDexTwo public dexInstance = IDexTwo(0xFf1d25EB895897a536c1b6b794E3110A787FB2d0);
    DexTwo public exploiter = new DexTwo(0xFf1d25EB895897a536c1b6b794E3110A787FB2d0);

    function setUp() public {}

    function test_drain() public {
        vm.startPrank(from, from);
        address token1 = dexInstance.token1();
        address token2 = dexInstance.token2();
        exploiter.drain();
        assert(
            IERC20(token1).balanceOf(address(dexInstance)) == 0 || IERC20(token2).balanceOf(address(dexInstance)) == 0
        );
    }
}
