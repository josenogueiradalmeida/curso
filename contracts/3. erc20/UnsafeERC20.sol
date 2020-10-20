// SPDX-License-Identifier: MIT

pragma solidity ^0.7.0;

contract UnsafeERC20  {

    mapping (address => uint256) private _balances;

    uint256 private _totalSupply;

    string private _name;
    string private _symbol;
    uint8 private _decimals;
    address public _dono;

    event Transfer(address sender, address recipient, uint256 amount);

    constructor (string memory __name, string memory __symbol)  {
        _name = __name;
        _symbol = __symbol;
        _decimals = 18;
        _dono = msg.sender;
    }
    
    modifier apenasDono() {
        require(msg.sender == _dono, "esse endereco nao e o dono");
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
    
    function transfer(address recipient, uint256 amount) public virtual returns (bool) {
         _transfer(msg.sender, recipient, amount);
       
        return true;
    }
    

   
    function _transfer(address sender, address recipient, uint256 amount) internal virtual {
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");

        _balances[sender] = _balances[sender] - amount;
        _balances[recipient] = _balances[recipient]+amount;
        emit Transfer(sender, recipient, amount);
    }

    function _mint(address account, uint256 amount) public apenasDono {
        require(account != address(0), "ERC20: mint to the zero address");
        _totalSupply = _totalSupply + amount;
        _balances[account] = _balances[account] + amount;
        emit Transfer(address(0), account, amount);
    }


    function _burn(address account, uint256 amount) public apenasDono {
        require(account != address(0), "ERC20: burn from the zero address");

        _balances[account] = _balances[account] + amount ;
        _totalSupply = _totalSupply - amount;
        emit Transfer(account, address(0), amount);
    }

   

    function _setupDecimals(uint8 decimals_) internal {
        _decimals = decimals_;
    }

 
}