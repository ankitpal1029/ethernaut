// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import {MagicNumberSolver} from "../src/MagicNumber.sol";

interface ISolver {
    function setSolver(address) external;

}

contract MagicNumberScript is Script {

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("pvt_key");
        vm.startBroadcast(deployerPrivateKey);
        MagicNumberSolver addy = new MagicNumberSolver();
        ISolver prob = ISolver(0x7b673330ddEF06207307C082A50BeD1eaB435C04);
        
        prob.setSolver(address(addy));
        vm.stopBroadcast();
    }
}
