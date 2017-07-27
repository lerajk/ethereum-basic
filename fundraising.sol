//https://www.zupzup.org/smart-contract-solidity/


pragma solidity ^0.4.6;

contract WinnerTakesAll{

	unit minimumEntryFee;
	unit public deadlineProjects;
	unit public winningFunds;
	unit public deadlineCampaign; 
	address public winningAddress;

	struct Project {

		address addr;
		string name;
		string url;
		unit funds;
		bool initialized;
	}

	mapping (address => Project) projects;
	address[] public projectAddresses;
	unit public numberofProjects; 

	function WinnderTakesAll(unit _minimumEntryFee, unit _durationProjects, unit _durationCampaign) public {

		if(_durationCampaign <= _durationProjects){ throw;}
		minimumEntryFee = _minimumEntryFee;
		deadlineProjects = now + _durationProjects * 1 seconds;
		deadlineCampaign = now + _durationCampaign * 1 seconds;
		winningAddress = msg.sender; 
		winningFunds = 0 ;

		} //WinnerTakesAll function

		function submitProject(string name, string url) payable public returns (bool success){

			if(msg.value < minimumEntryFee){ throw;}

			if (now > deadlineProjects){ throw; }

			if (!projects[msg.sender].initialized){

				projects[msg.sender] = Project(msg.sender, name, url, 0, true);

				projectAddresses.push(msg.sender);
				numberofProjects = projectAddresses.length;
				return true;

			} // initializedstuff

			return false;
		} // submitProject

		//actually submit the project 
		function supportProject(address addr) payable public returns (bool success){

				if(msg.value <= 0){ throw; }

				if(now > deadlineCampaign || now <= deadlineProjects){ throw; }

				if(!projects[addr].funds.initialized){throw;}

				projects[addr].funds += msg.value;
				if(projects[addr].funds > winningFunds){
					winningAddress = addr;
					winningFunds = projects[addr].funds;
				}

				return true;
			} //supportProject

		function getProjectInfo (address addr) public constant returns (string name, string url, uint funds){

			
		}	//getProjectInfo

} //winnertakesall contract 