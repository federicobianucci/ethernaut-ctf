// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

interface IShop {
    function price() external view returns (uint256);
    function isSold() external view returns (bool);
    function buy() external;
}

contract Shop {
    IShop shopInstance;

    constructor(address _instanceAddress) {
        shopInstance = IShop(_instanceAddress);
    }

    function price() external view returns (uint256) {
        if (!shopInstance.isSold()) {
            return shopInstance.price();
        } else {
            return 0;
        }
    }

    function buy() public {
        shopInstance.buy();
    }
}
