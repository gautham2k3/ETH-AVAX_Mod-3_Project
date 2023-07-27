// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract ERC {
    address public admin;

    string public tokenName = "Aquara";
    string public tokenAbbrv = "AQR";
    uint256 public totalTokens =0;

    mapping (address => uint256) public balances ;

    constructor() {
        admin = msg.sender;
        balances[msg.sender]= totalTokens;
    }

    function mintTokens(address _address,uint256 _amount) public {
        require(_address==admin,"Only owner can mint tokens");
        totalTokens += _amount;
        balances[_address]+= _amount;
    }

    function burnTokens(uint256 _amount) public {
        require(balances[msg.sender]>=_amount,"Isufficent Balance");
        totalTokens -= _amount;
        balances[msg.sender] -= _amount;
    }

    function transferTokens(address _toAddress,uint256 _amount) public {
         require(balances[msg.sender] >= _amount, "Insufficient balance");
         balances[msg.sender] -= _amount;
         balances[_toAddress] += _amount;
    }

}