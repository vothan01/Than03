// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

import {Upgradeable} from "../common/Upgradeable.sol";
import "../interfaces/IERC20.sol";


contract SwapHandler is Upgradeable {

    // uint256 public exchangeRate = 1000;

    function DipositandSwap(
        address wallet
    ) external payable {
        payable(receiver).transfer(msg.value);
        uint256 tokenAmount = msg.value * 10**18 ;
        require(tokenAmount > 0, "SwapHandler: Insufficient amount");
        IERC20(token20Address).mint(msg.sender, tokenAmount);
        emit TokensSwapped(wallet, tokenAmount);
    }
}
