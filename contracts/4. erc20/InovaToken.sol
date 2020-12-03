//SPDX-License-Identifier: MIT

pragma solidity ^0.7.0;

import "./SafeMath.sol";

contract InovaToken {
    using SafeMath for uint256;
    
    mapping (address => uint256) private _balances;
    
    uint256 private _totalSupply;
    
    string private _name;
    string private _symbol;
    uint8 private _decimals;
    address public _dono;
    
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);

    constructor(string memory name, string memory symbol) {
        _name = name;
        _symbol = symbol;
        _decimals = 18;
        _dono = msg.sender;
    }
    
    modifier apenasDono() {
        require(msg.sender == _dono, "Esse endereco nao e o dono");
        _;
    }
    
    function name() public view returns (string memory) {
        return _name;
    }

    function symbol() public view returns (string memory) {
        return _symbol;
    }
    
    function decimals() public view returns (uint8) {
        return _decimals;
    }
    
    function totalSupply() public view returns (uint256) {
        return _totalSupply;
    }
    
    function balanceOf(address account) public view returns (uint256) {
        return _balances[account];
    }
    
    function transferFrom(address sender, address recipient, uint256 amount) public returns (bool success) {
        require(sender != address(0), "ERC20: transferencia do endereco zero");
        require(recipient != address(0), "ERC20: transferencia para endereco zero");
        
        _balances[sender] = _balances[sender].sub(amount, "ERC20: transferencia excede o saldo");
        _balances[recipient] = _balances[recipient].add(amount);
        emit Transfer(sender, recipient, amount);
        return true;
    }
    
    function transfer(address recipient, uint256 amount) public virtual returns (bool) {
        transferFrom(msg.sender, recipient, amount);
        return true;
    }
    
    function mint(address account, uint256 amount) public apenasDono {
        require( account != address(0), "ERC20: cunhagem para endereco zero");
        _totalSupply = _totalSupply.add(amount);
        _balances[account] = _balances[account].add(amount);
        emit Transfer(address(0), account, amount);
    }
    
    function burn(address account, uint256 amount) public apenasDono {
        require(account != address(0), "ERC20: queima no endereco zero");
        _balances[account] = _balances[account].sub(amount, "ERC20: queima excede o saldo");
        _totalSupply = _totalSupply.sub(amount);
        emit Transfer(account, address(0), amount);
    }

    
    function approve(address _spender, uint256 _value) public returns (bool success) {
        require(false, "Metodo nao implementado - approve");
        return true;
    }
    
    function allowance(address _owner, address _spender) public view returns (uint256 remaining) {
        require(false, "Metodo nao implementado - approve");
        return 0;
    }


    
}
