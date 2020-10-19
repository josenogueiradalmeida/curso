// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.7.0;

import "./TokenNaoFungivel.sol";
import "./Produto.sol";

contract RegistroPropriedade is Produto, TokenNaoFungivel {
    
    function informaQuantidade(address _dono) public override view returns (uint256 _saldo) {
        return quantidade[_dono];
    }
    
    function _transfer(address _de, address _para, string memory _nomeProduto) private {
        quantidade[_de] = quantidade[_de] - 1;
        quantidade[_para] = quantidade[_para] + 1;
        dono[_nomeProduto] = _para;
        emit Transfer(_de, _para, _nomeProduto);
    }
    
    function transfere(address _para, string memory _nomeProduto) public override apenasDono(_nomeProduto) {
        _transfer(msg.sender, _para, _nomeProduto);
    }
}
