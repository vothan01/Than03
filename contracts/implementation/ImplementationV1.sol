// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

import {Upgradeable} from "../common/Upgradeable.sol";

contract ImplementationV1 is Upgradeable {


    /**
     * @dev setToken20Address
     * ** Params **
     * @param _addr address
     */
    function setToken20Address(address _addr) public onlyOwner {
        require(_addr != address(0), "Controller: The address can not be address 0");
        require(_addr != token20Address, "Controller: The address can not be the old address");
        token20Address = _addr;
    }

 function setswapHandler(address _addr) public onlyOwner {
        require(_addr != address(0), "Controller: The address can not be address 0");
        require(_addr != swapHandler, "Controller: The address can not be the old address");
        swapHandler = _addr;
    }

    function setReceiver(address _addr) public {
        require(_addr != address(0), "Controller: The address can not be address 0");
        require(_addr != receiver, "Controller: The address can not be the old address");
        receiver = _addr;
    }

    function DipositandSwap(
        address wallet
    ) external payable {
        _delegatecall(swapHandler);
    }
}