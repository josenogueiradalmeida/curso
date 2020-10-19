// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.7.0;

//Baseado no github.com/aostrun
contract Notarizacao{
    
    mapping( uint256 => Registro ) private registros; 
    uint256 private IDcorrente;
    
    struct Registro{
        string hash;
        uint256 epoca;
    }
        
    constructor() {
        IDcorrente = 0;
    }
    
    function criaRegistro(string memory hash) external  returns (uint256) {	
        Registro storage novoRegistro = registros[IDcorrente]; 
        novoRegistro.hash = hash;		   
        novoRegistro.epoca = block.timestamp;
        uint256 IDretorno = IDcorrente;
        IDcorrente = IDcorrente + 1;        
        return IDretorno;        
    }
    
    function buscaRegistro(uint256 recordId) external view returns (string memory, uint256) {
        return (registros[recordId].hash, registros[recordId].epoca);
    }   
    
}
