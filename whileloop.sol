// forked from https://github.com/fivedogit/solidity-baby-steps/blob/master/contracts/08_basiciterator.sol

contract BasicIterator {

	address creator;
	uint8[10] integers;

	function BasicIterator(){

		creator = msg.sender;
		uint8 x = 0;
		while(x < integers.length){

			integers[x] = x;
			x++; 
		} //whileloopends

	}//iteratorends

	function getSum() constant returns (uint){

		uint8 sum = 0;
		uint x = 0;
		while (x < integers.length){
			sum = sum + integers[x];
			x++;
		}
		return sum; 

		function kill(){

			if(msg.sender == creator){

				suicide(creator);
			}
		}
	}
} //contract ends

