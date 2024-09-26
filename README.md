# Degen Token

Degen Token (DGN) is a simple gaming ERC20 token deployed on the Ethereum blockchain. It allows for standard token functionalities such as transfer, minting, burning, and redemption.

## Overview

This repository contains the Solidity smart contract code for the Degen token, along with deployment and usage instructions.

## Features

- ERC20 compliant token.
- Minting: Only the owner can mint new tokens.
- Burning: Users can burn their tokens.
- Redemption: Users can redeem their tokens, which burns them and emits a Redeem event.
- Transfering: Users can Transfer their token to other users account.

## Usage

### Deployment

The contract can be deployed on any Ethereum-compatible network using tools like Remix, Truffle, or Hardhat.

### Interacting with the Contract

#### Minting Tokens

The `mint` function allows the contract owner to mint new tokens.

```solidity
function mint(address _owner, uint amount) public {
    require(msg.sender == _owner ,"Only owner can mint the tokens!");
    _mint(_owner, amount);
}
```
#### Transferring Tokens
The `transfer` function allows users to transfer tokens to another address.
```solidity
function transfer(address receiver , uint amount) override public virtual returns(bool){
    _transfer(_msgSender(), receiver, amount);
    return true;
}
```
#### Burning Tokens
Users can burn their tokens using the `burn` function.
```solidity
function burn(address from, uint amount) public {
    require(balanceOf(msg.sender) >= amount, "Insufficient Balance");
    _burn(from, amount);
}
```
#### Redeeming Tokens
The `redeem` function allows users to redeem their tokens.
```solidity
function redeem(address from, uint amount) public returns(uint) {
    require(balanceOf(from) >= amount, "Insufficient Balance");
    uint level = amount;
    _burn(from, amount);
    emit Redeem(from, amount);
    return level;
}
```
#### Checking Token Balance
The `token_balance` function allows users to check their token balance.
```solidity
function token_balance(address from) public view returns(uint) {
    return balanceOf(from);
}
```
### Contract Deployment on Avalanche Fuji Testnet
#### To deploy this contract on the Avalanche Fuji testnet, follow these steps:

Make sure you have access to an Avalanche wallet compatible with the Fuji testnet.
Compile the contract code using a Solidity compiler compatible with Avalanche, and obtain the compiled bytecode.
Deploy the contract to the Avalanche Fuji testnet using your Avalanche wallet's deployment functionality.
After deployment, interact with the contract using Avalanche-compatible tools and wallets.

## License
This project is licensed under the terms of the MIT license.
