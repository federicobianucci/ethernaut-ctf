// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

interface ICoinFlip {
    function flip(bool _guess) external returns (bool);
}

contract CoinFlip {
    uint256 lastHash;
    uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;
    ICoinFlip coinFlipInstance;

    constructor(address _instanceAddress) {
        coinFlipInstance = ICoinFlip(_instanceAddress);
    }

    function toss(bool _side) external returns (bool) {
        uint256 blockValue = uint256(blockhash(block.number - 1));

        if (lastHash == blockValue) {
            revert();
        }

        lastHash = blockValue;
        uint256 coinFlip = blockValue / FACTOR;
        bool side = coinFlip == 1 ? true : false;

        if (side == _side) {
            return coinFlipInstance.flip(side);
        } else {
            revert();
        }
    }
}
