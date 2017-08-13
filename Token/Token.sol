// ERC 20 Token 

pragma solidity ^0.4.14;

contract Token {

	uint256 public totalSupply;

	function balanceOf(address _owner) constant returns (uint256 balance);

	function transfer(address _to, uint256 _value) returns (bool success);

	function transferFrom(address _from, address _to, uint256 _value) returns (bool success);

	function approve(address _spender, uint256 _value) returns (bool sucess);

	function allowanace(address _owner, address _spender) constant returns (uint256 remaining);

	event Transfer(address indexed _from, address indexed _to, uint 256 value);
	event Approval(adress indexed _owner, address indexed _spender, uint256 _value);
	
} //contract ends