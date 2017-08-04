// https://learnxinyminutes.com/docs/solidity/

pragma solidity ^0.4.10;

contract SimpleBank {

	mapping (address => uint) private balances;

	address public owner;

	event LogDepositMade(address accountAddress, uint amount); 

	function SimpleBank(){

		owner = msg.sender;
	}

	function deposit() public returns (uint){
		balances[msg.sender] += msg.value;

		LogDepositMade(msg.sender, msg.value);

		reuturn balances[msg.sender];
	}

	function withdraw(uint withdrawAmount) public returns (uint remainingBal){
		if(balances[msg.sender] >= withdrawAmount){

		balances[msg.sender] -= withdrawAmount;

		if(!msg.sender.send(withdrawAmount)){
			balances[msg.sender] += withdrawAmount;
			} //secondif

		} //firstif

		return balances[msg.sender];

	} //withdraw functions

	function balance() constant returns (uint){
		return balances[msg.sender];
	}

	function(){
		throw; 
	}
} //contract ends