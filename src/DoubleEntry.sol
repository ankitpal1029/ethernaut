// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;


import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
interface CryptoVault {
    function sweepToken(IERC20 token) external;

}

interface IForta {
    function setDetectionBot(address detectionBotAddress) external;
    function notify(address user, bytes calldata msgData) external;
    function raiseAlert(address user) external;
}

contract AttackDoubleEntry {
    
    CryptoVault yo;

    
    constructor(address _cryptoVault) {
        yo = CryptoVault(_cryptoVault);
    }
    function handleTransaction(address user, bytes calldata msgData) external {
        address origUser;
        assembly{
            origUser := calldataload(0xa8)
        }
        
        if(origUser == address(yo)){
            IForta(msg.sender).raiseAlert(user);
        }
    }
}
