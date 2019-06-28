pragma solidity ^0.4.25;
contract TransactionInterface{
    function getTransaction(uint transactionId)external returns(uint, uint, string, uint);
}
contract AccountManagementContract{
    struct Account{
        string name;
        uint balance;
        uint32 drawCount;
        uint[] cardsId;
        uint[]transactionsId;
    }
    mapping(address => Account)accounts;
    function addAccount(address addr, string name)public{
        accounts[addr] = Account(name, 0, 5, new uint[](0), new uint[](0));
    }
    
    function getBalanceOf(address addr)external returns(uint){
        return accounts[addr].balance;
    }
    
    function setBalanceOf(address addr, uint balance)external{
        accounts[addr].balance = balance;
    }
    
    function removeCard(address owner, uint cardId)external{
        uint[] storage ids = accounts[owner].cardsId;
        for(uint i = 0; i < ids.length; i++){
            if(ids[i] == cardId){
                for(uint j = i; j < ids.length - 1; j++){
                    ids[j] = ids[j+1];
                }
                ids.length--;
                return;
            }
        }
    }
    
    function addCard(address who, uint cardId)external{
        accounts[who].cardsId.push(cardId);
    }
    
    function getDrawCountOf(address addr)external returns(uint32){
        return accounts[addr].drawCount;
    }
    
    function setDrawCountOf(address addr, uint count)external{
        accounts[addr].drawCount = uint32(count);
    }
    
    // function getAccountInfo(address addr)external returns(string, uint256, uint32, uint256){
    //     //returns string name, uint256 balance, uint32 drawCount
    //     //for cardsLength
        
    // }
    
    // function changeAccountInfo(string name){
    //     //change name
    // }
    
    // function getNumOfTransaction(address who)returns(uint){
    //     require(msg.sender == who);
    //     return accounts[who].transactionsId.length;
    // }
    
    // function getTransactionIdOf(uint index, address who)returns(uint){
    //     require(msg.sender == who);
    //     return accounts[who].transactionsId[index];
    // }
    
    // struct ApplicantInfo{
    //     address addr;
    //     string name;
    // }
    // mapping(address => ApplicantInfo) applicants;
    // address[] applicantAddresses;
    
    // function applyForAccount(address addr, string name)public{
    //     applicants[addr] = ApplicantInfo(addr, name);
    //     applicantAddresses.push(addr);
    // }

    // function getNumOfApplicants()public view returns(int256) {
    //     return int256(applicantAddresses.length);
    // }
    
    // function getApplicantInfo(uint index)public view returns(address, string name) {
    //     return (applicants[applicantAddresses[index]].addr, applicants[applicantAddresses[index]].name);
    // }
    
    // function agree(address addr) onlyOwner{
    //     addAccount(addr, applicants[addr].name);
    //     _deleteApplicant(addr);
    // }
    
    // function disagree(address addr) onlyOwner{
    //     _deleteApplicant(addr);
    // }
    
    // function _deleteApplicant(address addr)private{
    //     delete applicants[addr];
    //     int index = -1;
    //     for(uint i = 0; i < applicantAddresses.length; i++){
    //         if(applicantAddresses[i] == addr){
    //             index = int(i);
    //             break;
    //         }
    //     }
    //     if(index != -1){
    //         delete applicantAddresses[uint(index)];
    //         for(i = uint(index); i < applicantAddresses.length - 1; i++){
    //             applicantAddresses[i] = applicantAddresses[i+1];
    //         }
    //         applicantAddresses.length--;
    //     }
    // }

    function applyForReverse(bool role, uint transactionId, string discribe) external returns(bool){
        //new a ReverseApplication => ReApplicationId
        setReverseApplication(role, transactionId, ReApplicationId, discribe);
        //0��apply for reverse unsuccessfully
        //1��successfully
        
    }
    
    function getReverseApplictions()returns(string cardname, string timestamp){
        //get cardname && timestamp
    }
    
    function dealWithReserve(bool result){
        //true:exchange the card and delete the reverseApplication
        //false: delete the reverseApplication
    }
    

}