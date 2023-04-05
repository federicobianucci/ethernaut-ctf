// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

import "forge-std/Script.sol";
import "../src/20-Denial.sol";

contract DenialScript is Script {
    function setUp() public {}

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        address instanceAddress = 0x76A54e898491a78D571c325e31c9106555602a51;
        vm.startBroadcast(deployerPrivateKey);
        new Denial(instanceAddress);
        vm.stopBroadcast();
    }
}
