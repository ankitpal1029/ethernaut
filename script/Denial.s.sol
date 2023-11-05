// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script} from "forge-std/Script.sol";
import {console2} from "forge-std/console2.sol";

import {DenialAttacker} from "../src/Denial.sol";


contract Denial is Script {
    function run() external{
        uint256 deployerPrivateKey = vm.envUint("pvt_key");
        vm.startBroadcast(deployerPrivateKey);
        new DenialAttacker();
        vm.stopBroadcast();
        
    }
}
