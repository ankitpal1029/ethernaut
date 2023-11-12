// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Motorbike {
    function nukeMe() external {
        selfdestruct(payable(msg.sender));
    }
}