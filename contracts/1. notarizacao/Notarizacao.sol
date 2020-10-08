// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.6;

//Baseado no github.com/aostrun
contract Notarizacao{
    
    mapping( uint256 => Record ) private records;
    
    uint256 private currentId;
    
    struct Record{
        
        // Hash of the file that this record is protecting
        uint256 hash;
        
        // Store the timestamp of record creation
        uint256 createdAt;
               
    }
    
    event NewRecordCreated(uint256 recordId, hash, now);
        
    
    /*
        Constructor, initialize record counter
    */
    constructor() public{
        currentId = 0;
    }
    
    /*
        Create new record and add parties associated with this record and set its validity time
        uint256 hash, address[] _parties, uint256 validUntil
    */
    function createRecord(uint256 hash)
        external
        returns (uint256)
    {	
		
		// Limit max number of parties to 10
		
        // Create new record
        Record storage newRecord = records[currentId]; // = Record(0, new address[](0), new address[](0), 0, 0, 0);
        newRecord.hash = hash;		
   
        uint256 returnId = currentId;
        // Uncomment if you want to trigger event when new record is created
        //emit NewRecordCreated(currentId);
        currentId = currentId + 1;
        
        return returnId;
        
    }
    

    // Return the record hash 
    function getRecordInfo(uint256 recordId) 
        external 
        view
        returns (uint256, uint256)
    {
        return (records[recordId].createdAt, records[recordId].hash);
    }
   
    
}