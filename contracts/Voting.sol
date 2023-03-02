//SPDX-License-Identifier:UNLICENSED;

pragma solidity ^0.8.12;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

Contract Voting {
    
    address[] public listOfVoters;
    mapping(address => bool) userAlreadyVoted;
    IERC721 public erc721;
    
    constructor (address _nftAddress) {
      erc721 = IERC721(_nftAddress);
    }
    

    function vote() external returns(string memory) {

        if(!userAlreadyVoted[msg.sender]) {
       require(erc721.balance(msg.sender) > 0, "You Don't have NFT");
       listOfVoters.push(msg.sender);
       userAlreadyVoted[msg.sender] = true;
    }
    else {
        revert("Already voted");
    }

}


}