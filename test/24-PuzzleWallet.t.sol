// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import "forge-std/Test.sol";
import "forge-std/console2.sol";

import "../src/24-PuzzleWallet.sol";

contract PuzzleWalletTest is Test {
    address from = vm.envAddress("ETH_FROM");
    IPuzzleProxy proxy = IPuzzleProxy(0x46970b92871b615E42B9788da8c880BB138DB771);
    PuzzleWallet exploiter = new PuzzleWallet(0x46970b92871b615E42B9788da8c880BB138DB771);

    function setUp() public {}

    function test_attack() public {
        vm.startPrank(from, from);
        exploiter.attack{value: 0.001 ether}();
        assert(proxy.admin() == from);
    }
}
