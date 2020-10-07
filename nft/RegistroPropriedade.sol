pragma solidity ^0.6;

import "./TokenNaoFungivel.sol";
import "./Produto.sol";

contract RegistroPropriedade is Produto, TokenNaoFungivel {
    
    function informaQuantidade(address _dono) public override view returns (uint256 _saldo) {
        return quantidade[_dono];
    }
    
    function informaDono(uint256 _tokenId) public override view returns (address _dono) {
        return dono[_tokenId];
    }
    
    function _transfer(address _de, address _para, uint256 _tokenId) private {
        quantidade[_de] = quantidade[_de] - 1;
        quantidade[_para] = quantidade[_para] + 1;
        dono[_tokenId] = _para;
        emit Transfer(_de, _para, _tokenId);
    }
    
    function transfere(address _para, uint256 _tokenId) public override apenasDono(_tokenId) {
        _transfer(msg.sender, _para, _tokenId);
    }
}