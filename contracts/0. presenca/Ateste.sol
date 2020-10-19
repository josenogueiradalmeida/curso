// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.7.0;

contract Ateste {
    
    mapping (address => string) public confirmados;
    string[] public nomes;
    
    function atestar(string memory _nome) public {
        address enderecoQueDesejaAtestar = msg.sender;
        require( comparaString(confirmados[enderecoQueDesejaAtestar], "") , "Confirmacao ja realizada");
        confirmados[enderecoQueDesejaAtestar] = _nome;
        nomes.push(_nome);
    }

    function comparaString(string memory a, string memory b) private pure returns (bool) {
        return keccak256(abi.encodePacked(a)) 
                 == keccak256(abi.encodePacked(b));
    }
}
