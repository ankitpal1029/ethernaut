// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script} from "forge-std/Script.sol";
import {console2} from "forge-std/console2.sol";

interface ISwitch {
    function flipSwitch(bytes memory _data) external;
    function turnSwitchOff() external;
    function turnSwitchOn() external;
}

contract Switch is Script {
    function run() external{
        uint256 deployerPrivateKey = vm.envUint("pvt_key");
        vm.startBroadcast(deployerPrivateKey);
        
        /*
           function sig: flipSwitch(bytes memory data)
           bytes when data actually starts 020
           length of bytes
           function sig: turnOfSwitch()
           0x30c13ade
           0x0000000000000000000000000000000000000000000000000000000000000060 bytes when data actually starst
           0x0000000000000000000000000000000000000000000000000000000000000000
           0x20606e1500000000000000000000000000000000000000000000000000000000 should have turnSwitch()
           0x0000000000000000000000000000000000000000000000000000000000000004 length of data?
           0x76227e1200000000000000000000000000000000000000000000000000000000



        */
       
       bytes memory yo = "0x30c13ade0000000000000000000000000000000000000000000000000000000000000060000000000000000000000000000000000000000000000000000000000000000020606e1500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000476227e1200000000000000000000000000000000000000000000000000000000";
       ISwitch(0xD0D98E270c38dd187FAA4951BcA879A45803C8C5).flipSwitch(yo);
       
       


        vm.stopBroadcast();
        
    }
}
