//creating a minimum viable token

contract MyToken {

	//array with all balances
	mapping (address => uint256) public balanceOf;

	//get supply from the creator
	function MyToken(uint256 intitalSupply){

		balanceOf[msg.sender] = intitalSupply; //creater owns all coins
	}

	//send some coins
	function transfer(address _to, uint256 _value){

		if(balanceOf[msg.sender] < _value) throw;
		if(balanceOf[_to] + _value < balanceOf[_to]) throw;
		balanceOf[msg.sender] -= _value;
		balanceOf[_to] += _value;

		
	}



} //contract MyToken 