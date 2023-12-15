// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

contract MovieVoting {
    address public owner;
    mapping(string => uint256) public votes;

    event Voted(address indexed voter, string movie);

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }

    function vote(string memory movie) public {
        votes[movie]++;
        emit Voted(msg.sender, movie);
    }

    function getVotes(string memory movie) public view returns (uint256) {
        return votes[movie];
    }

    // Add more functions as needed
}
