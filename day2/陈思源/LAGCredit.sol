pragma solidity ^0.4.25;
//����ϵͳ



contract LAGC{
    //1. ���ַ��г�����ʼ��
    string name = "LAGC";  // �������� LIBRAIRIE AVANT-GARDE CREDIT 
    string symbol = "LAG"; // ���ּ�� 
    uint256 totalSupply; // ������
    
    // ��ַ��Ӧ��� 
    mapping (address => uint256) public balances; 
    // ����֪ͨ�ͻ��˻��ֽ��׷��� 
    event transferEvent(address from, address to, uint256 value);
    
    // ���캯�����ɻ��ִ�����ִ�У���� 
    constructor(uint256 initialSupply, string creditName, string creditSymbol) public { 
        //initialSupply:��ʼ����
        //creditName����������
	    //creditSymbol�����ּ��
        totalSupply = initialSupply; 
        balances[msg.sender] = totalSupply; 
        name = creditName; 
        symbol = creditSymbol; 

    }
    
    // ��ѯ���ַ����ܶ� 
    function getTotalSupply() constant returns (uint256) { 
        return totalSupply; 
        
    }
    
    // ���ֵķ��ͺ������ڲ����� 
    function _transfer(address _from, address _to, uint _value) internal {
        require(_to != 0x0); 
        require(balances[_from] >= _value); 
        require(balances[_to] + _value > balances[_to]); //_value����Ϊ��ֵ
        uint previousBalances = balances[_from] + balances[_to]; 
        balances[_from] -= _value; balances[_to] += _value;
        transferEvent(_from, _to, _value);   // ��¼ת�˲�֪ͨ�ͻ��˷������ֽ��� 
        assert(balances[_from] + balances[_to] == previousBalances);  
    }
    
    // �ͻ��˵��õĻ��ַ��ͺ��� 
    function transfer(address _to, uint256 _value) public { 
        _transfer(msg.sender, _to, _value); 
    }
    
    // ��ѯ�˻���� 
    function balanceOf(address _owner) constant returns (uint256) { 
        return balances[_owner]; 
        
    }
    
    

}