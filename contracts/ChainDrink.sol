// SPDX-License-Identifier: GPL-3.0

import "@openzeppelin/contracts/access/Ownable.sol";

pragma solidity ^0.8.9;
contract ChainDrink is Ownable {
    event Received(address from, uint256 amount);

    function buy() public payable {
        emit Received(msg.sender, msg.value);
    }

    function withdraw(uint256 amount) public onlyOwner {
        require(amount <= address(this).balance, "Not enough balance to withdraw") ;
        payable(owner()).transfer(amount);
    }
}