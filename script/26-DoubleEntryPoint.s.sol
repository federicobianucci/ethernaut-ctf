// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

import "forge-std/Script.sol";
import "../src/26-DoubleEntryPoint.sol";

interface IDoubleEntryPoint {
    function forta() external returns (IForta);
}

contract DoubleEntryPointScript is Script {
    IDoubleEntryPoint depToken = IDoubleEntryPoint(0xD91452c51Bcd6f2995343A3C74EA9A8f4F0cEBb3);

    function setUp() public {}

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);
        DetectionBot bot = new DetectionBot();
        depToken.forta().setDetectionBot(address(bot)); // player should do this before submitting the solution
        vm.stopBroadcast();
    }
}
