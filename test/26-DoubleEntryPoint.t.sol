// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import "forge-std/Test.sol";
import "forge-std/console2.sol";
import "openzeppelin-contracts/contracts/token/ERC20/IERC20.sol";
import "../src/26-DoubleEntryPoint.sol";

interface ICryptoVault {
    function sweepToken(IERC20 token) external;
}

interface IDoubleEntryPoint {
    function forta() external returns (IForta);
}

contract DoubleEntryPointTest is Test {
    address from = vm.envAddress("ETH_FROM");
    DetectionBot bot = new DetectionBot();
    ICryptoVault vault = ICryptoVault(0x9cE1B6a9Ef705534367813Dd9931B85Ae1f0cE64);
    IDoubleEntryPoint depToken = IDoubleEntryPoint(0xD91452c51Bcd6f2995343A3C74EA9A8f4F0cEBb3);
    IERC20 legacyToken = IERC20(0x50E096c6cf3Ca4D53c78620356e83ea880f932bb);

    function setUp() public {}

    function test_sweepTokenRevert() public {
        vm.startPrank(from, from);
        depToken.forta().setDetectionBot(address(bot));
        vm.expectRevert(bytes("Alert has been triggered, reverting"));
        vault.sweepToken(legacyToken);
    }
}
