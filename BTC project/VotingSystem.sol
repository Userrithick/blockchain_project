// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
//by rithick
contract VotingSystem {
    //Array to store candiate names
    string[5] public candidates;

    //Mapping to store the number of votes for each candidate
    mapping(string => uint256) private candidateVotes;

    //Event to notify when a vote is cast
    event Votecast(string candidate, uint256 newvotecount);

    //constructor to intialize candidate names
    constructor (){
        candidates[0] = "kamal";
        candidates[1] = "kannan";
        candidates[2] = "rithick";
        candidates[3] = "roshan";
        candidates[4] = "rohan";
    }

    //Function to cast a vote for a candidate
    function vote(uint8 candidateIndex) public {
        require(candidateIndex < 5, "Invalid candidate index");

        string memory selectedCandidate = candidates[candidateIndex];
        candidateVotes[selectedCandidate]++;
        emit Votecast(selectedCandidate, candidateVotes[selectedCandidate]);
    }

    //Function to get the current vote count for a candidate
    function getvotes(string memory candidate) public view returns (uint256) {
        return candidateVotes[candidate];
    }

    //Function  to get all candidate names
    function getcandidateNames()public view returns (string[5]memory){
        return candidates;
    }
}
