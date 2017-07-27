pragma solidity ^0.4.11;

contract Ballot {

	// struct is used to define a new type of something 
	struct Voter {

		uint weight;
		bool voted; //person voted or not
		address delegate; // ether address
		uint vote; 

	}

	struct Proposal {

		bytes32 name; 
		uint voteCount; 
	}

	address public chairperson; 

	mapping(address => Voter) public voters; //voter being stored in addresses? 

	Proposal[] public proposals;

	//a function to do something 
	function Ballot(bytes32[] proposalNames){

		chairperson = msg.sender;
		voters[chairperson].weight = 1;

		for(uint i = 0; i< proposalNames.length; i++){

			proposals.push(Proposal({
				name: proposalNames[i],
				voteCount: 0
				}));
			} // for loop ends

	} // function Ballot ends

 //voter can vote on the ballot. Only called by chairperson

 function giveRightToVote(address voter){

    require((msg.sender == chairperson) && !voters[voter].voted && (voters[voter].weight == 0));
	voters[voter].weight = 1;

 	} //giveRightToVote


  function delegate(address to){

  	 Voter storage sender = voters[msg.sender];
  	 require(!sender.voted);

  	 //can't vote for self
  	 require(to != msg.sender);

  	 //while loop
  	 while (voters[to].delegate != address(0)){

  	 	to = voters[to].delegate;

  	 	require(to != msg.sender);

  	 	} //while loop

  	 	sender.voted = true; 
  	 	sender.delegate = to;
  	 	Voter delegate = voters[to];
  	 	if (delegate.voted){
  	 		proposals[delegate.vote].voteCount += sender.weight;
  	 	} else {
  	 		delegate.weight += sender.weight;
  	 	}


  	}// functiondelegate

  	//function for voting
  	function vote(uint proposal){

  		Voter storage sender = voters[msg.sender];
  		require(!sender.voted);
  		sender.voted = true;
  		sender.vote = proposal;

  		proposals[proposal].voteCount += sender.weight;


  		} //function vote

  	function winningProposal() constant returns (uint winningProposal){

  		uint winningVoteCount = 0;
  		for (uint p = 0; p < proposals.length; p++){
  			if(proposals[p].voteCount > winningVoteCount){
  					winningVoteCount = proposals[p].voteCount;
  					winningProposal = p;
  			}

  		} //for loop 
  	} //winningproposal function 

  	function winnerName() constant returns (bytes32 winnerName){
  		winnerName = proposals[winningProposal()].name;
  	}


} // contract Ballot