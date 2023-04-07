// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import "forge-std/Test.sol";
import "forge-std/console2.sol";
import "openzeppelin-contracts/contracts/token/ERC20/IERC20.sol";

import "../src/22-Dex.sol";

contract DexTest is Test {
    address from = vm.envAddress("ETH_FROM");
    IDex public dexInstance = IDex(0x7e00c95Bc3FACC8a12c387B1Aa31062a07449406);
    Dex public exploiter = new Dex(0x7e00c95Bc3FACC8a12c387B1Aa31062a07449406);

    function setUp() public {}

    function test_drain() public {
        vm.startPrank(from, from);
        address token1 = dexInstance.token1();
        address token2 = dexInstance.token2();
        IERC20(token1).approve(address(exploiter), type(uint256).max);
        IERC20(token2).approve(address(exploiter), type(uint256).max);
        exploiter.drain();
        assert(
            IERC20(token1).balanceOf(address(dexInstance)) == 0 || IERC20(token2).balanceOf(address(dexInstance)) == 0
        );
    }
}
