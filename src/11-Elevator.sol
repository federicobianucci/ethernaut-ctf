// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

interface IElevator {
    function floor() external returns (uint256);
    function goTo(uint256 _floor) external;
}

contract Elevator {
    IElevator elevatorInstance;

    constructor(address _instanceAddress) {
        elevatorInstance = IElevator(_instanceAddress);
    }

    function isLastFloor(uint256 _floor) external returns (bool) {
        if (elevatorInstance.floor() == _floor) {
            return true;
        }
        return false;
    }

    function goTo(uint256 _floor) external {
        elevatorInstance.goTo(_floor);
    }
}
