// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script} from "forge-std/Script.sol";
import {console2} from "forge-std/console2.sol";

import {BuyerAttack} from "../src/Buyer.sol";


contract Buyer is Script {
    function run() external{
        uint256 deployerPrivateKey = vm.envUint("pvt_key");
        vm.startBroadcast(deployerPrivateKey);
        BuyerAttack yo = new BuyerAttack();
        yo.callMe();
        vm.stopBroadcast();
        
    }
}
