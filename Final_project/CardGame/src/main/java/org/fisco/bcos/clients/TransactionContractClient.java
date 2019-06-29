package org.fisco.bcos.clients;

import org.fisco.bcos.beans.TransactionInfo;
import org.fisco.bcos.web3j.crypto.Credentials;

public class TransactionContractClient extends ContractClient{
    public TransactionContractClient(Credentials credentials, String contractAddress){
        super(credentials, contractAddress);
    }

    @Override
    public void load(){

    }

    public TransactionInfo getTransactionInfo(String transactionId){
        return new TransactionInfo();
    }
}
