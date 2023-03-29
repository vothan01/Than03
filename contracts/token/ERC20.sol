// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Token is ERC20, Ownable {
    constructor(address _controller, string memory name, string memory symbol) ERC20(name, symbol) {
        setController(_controller);
    }

    address public controller;

    function setController(address _controller) public onlyOwner {
        controller = _controller;
    }


    modifier onlyControllers() {
        require(
            msg.sender == controller ||
                msg.sender == owner() ||
                msg.sender == address(this),
            "Token: Only controllers"
        );
        _;
    }


    function mint(address _to, uint256 _amount) public onlyControllers {
        _mint(_to, _amount);
    }

    function burn(address _from, uint256 _amount) public onlyOwner {
        _burn(_from, _amount);
    }
}