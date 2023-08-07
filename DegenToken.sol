// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "hardhat/console.sol";

contract DegenToken is ERC20, Ownable,ERC20Burnable  {

    struct str {
       
        string itemName;
        uint256 itemPrice;
       
    }

    str[] private _storestrs;

    constructor() ERC20("Degen", "DGN") {
        _storestrs.push(str("Tshirts", 250));
        _storestrs.push(str("Jeans", 450));
        _storestrs.push(str("hoodie", 1100));
    }

      function tokenTransfer(address owner, uint _amount) external {
        require(balanceOf(msg.sender) >= _amount, "Low  Balance!! ");
        approve(msg.sender, _amount);
        transferFrom(msg.sender, owner, _amount);
    }


    function mintcoins(address to, uint _amount) public onlyOwner {
        _mint(to, _amount);
    }

      function burncoins(uint _amount) external {
        _burn(msg.sender, _amount);
    }

  
    function redeemItems(uint listNumber) external payable returns (string memory) {
        require(listNumber > 0 && listNumber <= _storestrs.length, "choice not avilable for you");
        str memory Str = _storestrs[listNumber-1];
        require(this.balanceOf(msg.sender) >= Str.itemPrice, "Insufficient Balance in your account");
        approve(msg.sender, Str.itemPrice);
        transferFrom(msg.sender, owner(), Str.itemPrice);
        return string.concat(" Congratulations You  successfully redeemed tokens for ", Str.itemName);
    }

    function check_amount() external view returns (uint) {
        return balanceOf(msg.sender);
    }

    function showStorestrs() external view returns (string memory) {
        string memory response = "Available items are shown as:";

        for (uint i = 0; i < _storestrs.length; ++i) {
            response = string.concat(response, "\n", Strings.toString(i+1), ". ", _storestrs[i].itemName );
            }
 
        return response;
    }
  
}
