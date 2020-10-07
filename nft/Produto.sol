pragma solidity ^0.6;

contract Produto {
    
    event NovoProduto(uint produtoId, string nome);
    
    uint IDcorrente = 0;
    
    struct Produto {
        string nome;
      }
    
    Produto[] public produtos;
    mapping (uint => address) public dono;
    mapping (address => uint) quantidade;

    modifier apenasDono(uint _produtoId) {
        require(msg.sender == dono[_produtoId]);
        _;
    }
    
    function criaProduto(string memory  _nome) public {
        produtos.push(Produto(_nome))  ;
        uint id = ++IDcorrente;
        dono[id] = msg.sender;
        quantidade[msg.sender]++;
        emit NovoProduto(id, _nome);
    }
}