// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract FakeLibrary {
    address fake;
    address fake2;
    address newOwner;
    
    function setTime(uint _newOwner) public {
        newOwner = address(uint160(_newOwner));
    }
}