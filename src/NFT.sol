// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.20;

import {ERC721} from "lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";
// import {ERC721Enumerable} from "lib/openzeppelin-contracts/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import {ERC721URIStorage} from "lib/openzeppelin-contracts/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

contract NFT is ERC721, ERC721URIStorage {
    uint256 public currentTokenId = 1;
    uint256 public constant maxSupply = 8;

    constructor() ERC721("Super Mario World", "SMW") {}

    function mint() public returns (uint256) {
        require(currentTokenId <= maxSupply, "Max supply reached");
        _safeMint(msg.sender, currentTokenId);
        return currentTokenId++;
    }

    function supportsInterface(
        bytes4 interfaceId
    ) public view virtual override(ERC721URIStorage, ERC721) returns (bool) {
        return super.supportsInterface(interfaceId);
    }

    function tokenURI(
        uint256 tokenId
    ) public view override(ERC721, ERC721URIStorage) returns (string memory) {
        return string(abi.encodePacked(super.tokenURI(tokenId), ".jpg"));
    }

    function _baseURI() internal pure override returns (string memory) {
        return
            "https://scarlet-scared-wildcat-411.mypinata.cloud/ipfs/QmXPdhZunk5psvpvWCHpg99G8TRSyPpzn46p5DjJbzrS4h/";
    }
}
