// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.7.2;

contract Produto {
    
    event NovoProduto(string nomeProduto);

    string[] public produtos;
    mapping (string => address) public dono;
    mapping (address => uint) quantidade;

    modifier apenasDono(string memory _nomeProduto) {
        require(msg.sender == dono[_nomeProduto]);
        _;
    }
    
    function comparaString(string memory a, string memory b) private pure returns (bool) {
        return keccak256(abi.encodePacked(a)) 
                 == keccak256(abi.encodePacked(b));
    }
    
    function buscaProduto(string memory _produtoBuscado) public view returns (int) {
        
        for (uint i=0; i < produtos.length; i++) {
            if ( comparaString( produtos[i] , _produtoBuscado ) ) {
                return int(i);
            }
        }
        return -1;
    }
    
    
    function criaProduto(string memory  _nomeProduto) public {
        require ( buscaProduto(_nomeProduto) == -1 , "Produto ja existe e tem dono!" );
        produtos.push(_nomeProduto)  ;
        dono[_nomeProduto] = msg.sender;
        quantidade[msg.sender]++;
        emit NovoProduto(_nomeProduto);
    }
}