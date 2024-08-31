// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.19;
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract Staking {
    IERC20 public s_stakingToken;
    //we map users address to how much they have staked 
    mapping(address => uint256) public s_balances; 

//This code states that at deployment the token address should be passed in
    constructor(address stakingToken) {
        s_stakingToken = IERC20(stakingToken);
    }
    function stake(uint256 amount) external {
        //keep track of how much each user has staked
        //keep track of ho much token we have
        //transfer tokens to contract

        //Here we keep track of users balances by increasing the balance with he amount they have staked
        s_balances[msg.sender] = s_balances[msg.sender] + amount;
    }
}


