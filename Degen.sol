// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Degen is ERC20{
    event Redeem(address indexed from ,uint indexed amount);
    mapping(string=>uint) public i_price;
    constructor() ERC20("Degen", "DGN") {}

        function mint(address _owner, uint amount) public {
            require(msg.sender == _owner ,"Only owner can mint the tokens!");
            _mint(_owner, amount);
    }
    function transfer(address reciver , uint amount)override public virtual returns(bool){
            _transfer(_msgSender(),reciver,amount);
            return true;
    }
    function redeem(string memory i_name, address from) public returns (uint) {
        uint price = i_price[i_name];
        require(balanceOf(from) >= price, "Insufficient Balance");
        _burn(from, price);
        emit Redeem(from,price);
        return price;
    }
    function setItemPrice(string memory i_name, uint price,address _owner) public {
        require(_owner==msg.sender,"Only Owner can set price of items");
        i_price[i_name] = price;
    }
    function token_balance(address from)public view returns(uint){
        return balanceOf(from);
    }
    function burn(address from,uint amount)public{
        require (balanceOf(msg.sender)>amount,"Insufficient Balance");
        _burn(from, amount);
    }
}
