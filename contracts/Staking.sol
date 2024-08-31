// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.19;
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";


error Staking_TransferFailed();
contract Staking {
    IERC20 public s_stakingToken;
    //we map users address to how much they have staked 
    mapping(address => uint256) public s_balances; 

    uint256 public s_totalSupply;

//This code states that at deployment the token address should be passed in
    constructor(address stakingToken) {
        s_stakingToken = IERC20(stakingToken);
    }
    function stake(uint256 amount) external {
        //keep track of how much each user has staked
        //keep track of ho much token we have
        //transfer tokens to contract

        //Here we keep track of users balances by increasing the balance with he amount they have staked, here we use the mapping to track the address of each user
        s_balances[msg.sender] = s_balances[msg.sender] + amount;

        //this code tracks the total supply of tokens that have been sent to the contract
        s_totalSupply = s_totalSupply + amount;


        //This code makes use of the transferFrom function in ERC20 to transfer tokens to our contract account
       bool success =  s_stakingToken.transferFrom(msg.sender, address(this), amount);
        require(success, "Failed");

    }
}


