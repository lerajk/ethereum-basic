
/* a simple hello world contract. */ 


pragma solidity ^0.4.0;

contract mortal { 
    
    address owner;
    
    function mortal(){
        owner = msg.sender;
    }
    
    function kill(){
        
        if(msg.sender == owner){
            
            selfdestruct(owner);
        }
    } //function kill ends 
    
} //contract end 

contract greeter is mortal {
    
    string greeting;
    
    function greeter (string _greeting) public {
        
        greeting = _greeting;
    }
    
    function greet() constant returns (string){
        return greeting; 
    }
    
  
} // greeter is mortal ends