// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

import {Upgradeable} from "../common/Upgradeable.sol";

contract Implementation is Upgradeable{

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

    /**
     * @dev setAdmin
     * ** Params **
     * @param _address address
     */
    function setAdmin(address _address) public onlyOwner {
        require(_address != address(0), "Controller: Invalid address");
        admin[_address] = true;
        adminArray.push(_address);
    }

    /**
     * @dev setWhitelist
     * ** Params **
     * @param _address address
     */
    function setWhitelist(address _address) public onlyAdmin {
        require(_address != address(0), "Controller: Invalid address");
        whiteList[_address] = true;
        whitelistArray.push(_address);
    }

    /**
     * @dev setAirdropHandler
     * ** Params **
     * @param _addr address
     */
    function setAirdropHandler(address _addr) public onlyOwner {
        require(_addr != address(0), "Controller: The address can not be address 0");
        require(_addr != AirdropHandler, "Controller: The address can not be the old address");
        AirdropHandler = _addr;
    }


/**    
     * @dev Airdrop Token to Whitelist User
     * ** Params ** 
     * @param _receiver list of receiver
     * @param _amount amount of token to airdrop for each user
     */
    function Airdrop(
        address[] memory _receiver,
        uint256 _amount
    ) public onlyOwner {
        _delegatecall(AirdropHandler);
    }
}