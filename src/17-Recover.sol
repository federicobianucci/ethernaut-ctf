// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

interface ISimpleToken {
    function destroy(address payable _to) external;
}

contract Recover {
    constructor() {}

    function recover(address _token) external {
        ISimpleToken(_token).destroy(payable(tx.origin));
    }
}
