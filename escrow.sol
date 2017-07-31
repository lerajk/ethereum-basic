contract Purchase {
	address seller;
	address buyer;
	uint value;
	enum State {Created, Confirmed, Disabled}
	State state;
	modifier condition(bool c){
		if (!c) throw;
		_
	}
	modifier inState(State s) {
		if (state != s) throw; 
		_
	}
	modifier onlyBuyer(){
		if (msg.sender != buyer) throw; 
		_
	}

	function Purchase() condition(msg.value % 2 ==0 ){
		seller = msg.sender;
		value = msg.value / 2;
	}

	function confirmPurchase() inState(State.Created) condition(msg.vale == 2 * value)

	{
		if(state != State.Created) throw;
		if (msg.vale != 2 * value) throw;
		buyer = msg.sender; 
		state = State.Confirmed;
	}

	function confirmReceived() inState(State.Confirmed) onlyBuyer {
		if(state != State.Confirmed) throw;
		if(msg.sender != buyer) throw;
		buyer.send(value);
		seller.send(this.balance);
		state = State.Disabled; 
	}

	function refundBuyer(){
		if (state != State.Confirmed) throw; 
		if(msg.sender != seller) throw; 
		buyer.send(2 * value); 
		seller.send(this.balance);
		state = State.Disabled; 
	}
}