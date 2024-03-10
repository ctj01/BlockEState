
// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

import "@openzeppelin/contracts@4.6.0/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts@4.6.0/utils/Counters.sol";
import "@openzeppelin/contracts@4.6.0/utils/Base64.sol";
import "@openzeppelin/contracts@4.6.0/access/AccessControl.sol";

contract RealStateNFT is ERC721URIStorage, AccessControl {
    using Counters for Counters.Counter;
    using Strings for uint256;
    address public owner;
    Counters.Counter public tokenIdCounter;
    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");
    bytes32 public constant BURNER_ROLE = keccak256("BURNER_ROLE");
    bytes32 public constant MANAGER_ROLE = keccak256("MANAGER_ROLE");
    mapping(uint256 => address) public tokenOwners;


   struct RealState {
        string description;
        string image;
        uint area; 
        uint rooms;
        uint bathrooms;
        bool isSold;
        uint garage;
        string location;
        uint price;
        string addresses;
        uint createdAt;
  }
    
    mapping (uint256 => RealState) realStates;
    mapping (uint256 => uint256) nftPrice;
    mapping (uint256 => uint256) amountSold;
    
    constructor() ERC721("RealStateNFT", "RSNFT") {
        owner = msg.sender;
        _grantRole(DEFAULT_ADMIN_ROLE, msg.sender);
        _grantRole(MINTER_ROLE, msg.sender);
        _grantRole(BURNER_ROLE, msg.sender);
        _grantRole(MANAGER_ROLE, msg.sender);
    }
    
      function mint(address to, string memory _tokenURI)  public {
        require(hasRole(MINTER_ROLE, msg.sender), "Caller is not a minter");
        tokenIdCounter.increment();
        uint256 tokenId = tokenIdCounter.current();
        tokenOwners[tokenId] = to;
        _safeMint(to, tokenId);
        _setTokenURI(tokenId, _tokenURI);
    }
    modifier tokenExists(uint256 tokenId) {
        require(_exists(tokenId), "Token does not exist");
        _;
    }
    modifier tokenOwner(uint256 tokenId) {
        require(tokenOwners[tokenId] == msg.sender, "You are not the owner of this token");
        _;
    }
    modifier checkBalance(uint256 tokenId) {
        require(msg.value >= nftPrice[tokenId], "Insufficient balance");
        _;
    }

    function tokenURI(uint256 tokenId)
        public view override(ERC721URIStorage) returns (string memory)
    {
        return super.tokenURI(tokenId);
    }
    function transferOwnershipToken(address from, address to, uint256 tokenId, uint256 price) public {
        require(hasRole(MANAGER_ROLE, msg.sender), "Caller is not a manager");
        require(tokenOwners[tokenId] == from, "You are not the owner of this token");
        require(nftPrice[tokenId] == price, "Price is not correct");
        require(msg.value >= price, "Insufficient balance");
        _transfer(from, to, tokenId);
    }

    // The following function is an override required by Solidity.
    function _burn(uint256 tokenId) internal override(ERC721URIStorage)
    {
        super._burn(tokenId);
    }


    function supportsInterface(bytes4 interfaceId) public view override(ERC721, AccessControl) returns (bool) {
        return super.supportsInterface(interfaceId);
    }
        
}