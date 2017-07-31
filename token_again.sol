//creating a minimum viable token
//https://www.ethereum.org/token

contract owned {

	address public owner;

	function owned(){
		owner = msg.sender;
	}

	modifier onlyOwner {
		if (msg.sender != owner) throw;
		_;
	}

	function transferOwnership (address newOwner) onlyOwner {
		owner = newOwner; 
	}

} //owned contract


contract MyToken is owned {

	//array with all balances
	mapping (address => uint256) public balanceOf;
	string public name;
	string public symbol;
	uint8 public decimals;

	//adding events to know what happens in the wallet to keep track
	event Transfer(address indexed from, address indexed to, uint256 value);
	event Burn(address indexed from, uint256 value);

	//get supply from the creator
	function MyToken(uint256 intitalSupply, string tokenName, uint8 decimalUnits, string tokenSymbol){

		balanceOf[msg.sender] = intitalSupply; //creater owns all coins
		name = tokenName;
		symbol = tokenSymbol;
		decimals = decimalUnits; 
	}

	//send some coins
	function transfer(address _to, uint256 _value){

		if(balanceOf[msg.sender] < _value) throw;
		if(balanceOf[_to] + _value < balanceOf[_to]) throw;
		balanceOf[msg.sender] -= _value;
		balanceOf[_to] += _value;
		Transfer(msg.sender, _to, _value);




	}



} //contract MyToken 