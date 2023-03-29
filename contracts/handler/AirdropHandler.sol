// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

import {Upgradeable} from "../common/Upgradeable.sol";
import "../interfaces/IERC20.sol";


contract AirdropHandler is Upgradeable{

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
        require(_amount > 0, "Airdrop: Amount must be greater than 0");
        for (uint256 i = 0; i < _receiver.length; i++) {
            if (whiteList[_receiver[i]] == true) {
                IERC20(token20Address).mint(_receiver[i], _amount);
            }
            emit AirdropEvent(_receiver[i], _amount);
        }
    }

}