// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Degen is ERC20{
    event Redeem(address indexed from ,uint indexed amount);
    constructor() ERC20("Degen", "DGN") {}

        function mint(address _owner, uint amount) public {
            require(msg.sender == _owner ,"Only owner can mint the tokens!");
            _mint(_owner, amount);
    }
    function transfer(address reciver , uint amount)override public virtual returns(bool){
            _transfer(_msgSender(),reciver,amount);
            return true;
    }
    function redeem(address from,uint amount)public returns(uint){
            require (balanceOf(from)>amount,"Insufficient Balance");
            uint level = amount;
            _burn(from, amount);
            emit Redeem(from,amount);
            return level;
    }
    function token_balance(address from)public view returns(uint){
        return balanceOf(from);
    }
    function burn(address from,uint amount)public{
        require (balanceOf(msg.sender)>amount,"Insufficient Balance");
        _burn(from, amount);
    }
}