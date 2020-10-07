pragma solidity ^0.6;

abstract contract TokenNaoFungivel {
    
    event Transfer(address indexed _de, address indexed _para, uint256 _tokenId);
  
    function informaSaldo(address _dono) public view virtual returns (uint256 _saldo);
    function informaDono(uint256 _tokenId) public view virtual returns (address _dono);
    function transfere(address _para, uint256 _tokenId) public virtual;
    
}