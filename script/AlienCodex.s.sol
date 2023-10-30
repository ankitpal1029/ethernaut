// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script} from "forge-std/Script.sol";
import {console2} from "forge-std/console2.sol";

import {BreakAlienCodex } from "../src/AlienCodex.sol";


contract ExploitGateKeeperOne is Script {
    function run() external{
        uint256 deployerPrivateKey = vm.envUint("pvt_key");
        vm.startBroadcast(deployerPrivateKey);
        BreakAlienCodex yo = new BreakAlienCodex();
        yo.exploit();

        vm.stopBroadcast();
        
    }
}
