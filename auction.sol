pragma solidity ^0.4.11;

contract Ballot {

	// struct is used to define a new type of something 
	struct Voter {

		uint weight;
		bool voted; //person voted or not
		address delegate; // ether address
		unit vote; 

	}

	struct Proposal {

		bytes32 name; 
		unit voteCount; 
	}

	address public chairperson; 

	mapping(address => Voter) public voters; //voter being stored in addresses? 

	Proposal[] public proposals;

	//a function to do something 
	function Ballot(bytes32[] proposalNames){

		chairperson = msg.sender;
		voters[chairperson].weight = 1;

		for(unit i = 0; i< proposalNames.length; i++){

			proposals.push(Proposal({
				name: proposalNames[i],
				voteCount: 0
				}));
			} // for loop ends

	} // function Ballot ends

 //voter can vote on the ballot. Only called by chairperson

 function giveRightToVote(address voter){

 	require((msg.sender == chairperson) && !voters[voter].voted && (voters[voter].weight) == 0));
	voters[voter].weight = 1;

 	} //giveRightToVote


} // contract Ballot