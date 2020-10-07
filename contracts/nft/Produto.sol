// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.6;

contract Produto {
    
    event NovoProduto(string nomeProduto);

    string[] public produtos;
    mapping (string => address) public dono;
    mapping (address => uint) quantidade;

    modifier apenasDono(string memory _nomeProduto) {
        require(msg.sender == dono[_nomeProduto]);
        _;
    }
    
    function criaProduto(string memory  _nomeProduto) public {
        produtos.push(_nomeProduto)  ;
        dono[_nomeProduto] = msg.sender;
        quantidade[msg.sender]++;
        emit NovoProduto(_nomeProduto);
    }
}