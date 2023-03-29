// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

import "./ReentrancyGuard.sol";
import "@openzeppelin/contracts/access/Ownable.sol";


contract Upgradeable is Ownable, ReentrancyGuard {
    address public token20Address;    
    address public AirdropHandler;

    address[] public adminArray;
    address[] public whitelistArray;

    mapping(address => bool) admin; 
    mapping(address => bool) whiteList;

    event AirdropEvent(address indexed _receiver, uint256 _amount);

    modifier onlyAdmin(){
        require(msg.sender == owner() || admin[msg.sender] == true,
        "Controller: The caller is not owner or super admin");
        _;
    }

    // == COMMON FUNCTIONS == //
    function _delegatecall(address _impl) internal virtual {
        require(
            _impl != address(0),
            "Implementation: impl address is zero address"
        );
        assembly {
            calldatacopy(0, 0, calldatasize())
            let result := delegatecall(
                sub(gas(), 10000),
                _impl,
                0,
                calldatasize(),
                0,
                0
            )
            let size := returndatasize()
            returndatacopy(0, 0, size)
            switch result
            case 0 {
                revert(0, size)
            }
            default {
                return(0, size)
            }
        }
    }

}