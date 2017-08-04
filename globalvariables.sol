//global variables in solidity 

pragma solidity ^0.4.10;

contract basicInfoGetter{

	address creator; 

	function basicInfoGetter() public {

		creator = msg.sender;
	}

	function getCurrentMinerAddress() constant returns (address){

		return block.coinbase;
	}

	function getCurrentDifficulty() constant returns (uint){

		return block.difficulty;
	} 

	function getCurrentGaslimit() constant returns (uint){
		return block.gaslimit;
	}

	function getCurrentBlockNumber() constant returns (uint){

		return block.number;
	}

	function getBlockTimestamp() constant returns (uint){

		return block.timestamp;
	}

	function getMsgData() constant returns (bytes){

		return msg.data;
	}

	function getMsgSender() constant returns (address){

		return msg.sender;
	}

	function getMsgValue() constant returns (uint){

		return msg.value; 
	}

	function getMsgGas() constant returns (uint){
		return msg.gas;
	}

	function getTxGasPrice() constant returns (uint){
		return tx.gasprice;
	}

	

} //contract ends