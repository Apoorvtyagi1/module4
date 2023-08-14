// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

contract DegenToken is ERC20, Ownable, ERC20Burnable {
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

    event ItemRedeemed(address indexed user, string itemName, uint256 itemPrice);

    function redeemItems(uint listNumber) external returns (string memory) {
        require(listNumber > 0 && listNumber <= _storestrs.length, "Choice not available for you");
        str memory selectedStr = _storestrs[listNumber - 1];

        // Check if the user has enough tokens
        require(balanceOf(msg.sender) >= selectedStr.itemPrice, "Insufficient Balance in your account");

        // Transfer tokens from the user to the contract owner
        _transfer(msg.sender, owner(), selectedStr.itemPrice);

        // Emit an event to log the redemption
        emit ItemRedeemed(msg.sender, selectedStr.itemName, selectedStr.itemPrice);

        // Return a success message
        return string(abi.encodePacked("Congratulations! You successfully redeemed tokens for ", selectedStr.itemName));
    }

    function check_amount() external view returns (uint) {
        return balanceOf(msg.sender);
    }

    function showStorestrs() external view returns (string memory) {
        string memory response = "Available items are shown as:";

        for (uint i = 0; i < _storestrs.length; ++i) {
            response = string.concat(response, "\n", Strings.toString(i+1), ". ", _storestrs[i].itemName);
        }

        return response;
    }
}
