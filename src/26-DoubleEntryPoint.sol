// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

interface IDetectionBot {
    function handleTransaction(address user, bytes calldata msgData) external;
}

interface IForta {
    function setDetectionBot(address bot) external;
    function raiseAlert(address user) external;
}

contract DetectionBot is IDetectionBot {
    address constant vaultAddress = 0x9cE1B6a9Ef705534367813Dd9931B85Ae1f0cE64;

    function handleTransaction(address user, bytes calldata msgData) external {
        (,, address origSender) = abi.decode(msgData[4:], (address, uint256, address));
        if (origSender == vaultAddress) {
            IForta(msg.sender).raiseAlert(user);
        }
    }
}
