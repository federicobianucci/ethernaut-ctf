// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Force {
    address instanceAddress;

    constructor(address _instanceAddress) payable {
        instanceAddress = _instanceAddress;
    }

    function force() external {
        selfdestruct(payable(instanceAddress));
    }
}
