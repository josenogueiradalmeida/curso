// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.7.0;

contract ListaPresenca {
    
    mapping (uint => address[]) private lista;
    enum Aula {Lab1,Lab2,Lab3} Aula aula;
    
    function confirmarPresenca(Aula _lab) public {
        address enderecoQueDesejaMarcarPresenca = msg.sender;
        require( !encontrarPresenca(enderecoQueDesejaMarcarPresenca, _lab), "Aluno ja marcou presenca no dia.");
        address[] storage enderecos = lista[(uint)(_lab)];
        enderecos.push(enderecoQueDesejaMarcarPresenca);
    }

    function encontrarPresenca(address _enderecoProcurado, Aula _lab) public view returns (bool) {
        address[] storage enderecos = lista[(uint)(_lab)];
        for (uint i=0; i < enderecos.length; i++) {
            if ( enderecos[i] == _enderecoProcurado )
                return true;
        }
        return false;        
    }

    function mostrarQuantidadePresentesDaAula(Aula _lab) public view returns (uint) {
        return lista[(uint)(_lab)].length;
    }

    function listarPresentesDaAula(Aula _lab) public view returns (address[] memory) {
        return lista[(uint)(_lab)];
    }

}
