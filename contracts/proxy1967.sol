// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

import "@openzeppelin/contracts/proxy/ERC1967/ERC1967Proxy.sol";
import "@openzeppelin/contracts/access/Ownable.sol";


contract MyProxyBaseContract is ERC1967Proxy, Ownable {

    constructor(address _logic, bytes memory _data) ERC1967Proxy(_logic, _data) {}

    function upgrade(address _newLogic) external {
        _upgradeTo(_newLogic);
    }

    function implementation() external view returns (address) {
        return _implementation();
    }

}