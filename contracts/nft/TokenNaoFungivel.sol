// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.6;

abstract contract TokenNaoFungivel {
    
    event Transfer(address indexed _de, address indexed _para,  string _nomeProduto);
  
    function informaQuantidade(address _dono) public view virtual returns (uint256 _saldo);
    function transfere(address _para,  string memory _nomeProduto) public virtual;
    
}