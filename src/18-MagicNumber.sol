// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

interface IMagicNumber {
    function setSolver(address _solver) external;
}

contract MagicNumber {
    constructor(address _instanceAddress) {
        // 600a600c600039 -> CODECOPY(0x00, 0x0c, 0x0a) -> copy the contract code to memory
        // 600a6000f3 -> RETURN(0x00, 0x0a) -> return the contract code
        // 602a60805260206080f3 -> contract code
        bytes memory bytecode = hex"600a600c600039600a6000f3602a60805260206080f3";
        address solver;

        assembly {
            solver := create(0, add(bytecode, 0x20), mload(bytecode))
        }

        IMagicNumber(_instanceAddress).setSolver(solver);
    }
}
