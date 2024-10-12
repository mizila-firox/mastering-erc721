// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.20;

import {Script, console} from "forge-std/Script.sol";
import {NFT} from "../src/NFT.sol";
import {IERC721Receiver} from "lib/openzeppelin-contracts/contracts/interfaces/IERC721Receiver.sol";

contract Foo is Script, IERC721Receiver {
    NFT public nft;

    function setUp() external {
        nft = new NFT();
    }

    function testMint() external {
        for (uint i = 1; i <= 8; i++) {
            uint256 tokenId = nft.mint();
            console.log(nft.tokenURI(i));
        }
    }

    function onERC721Received(
        address operator,
        address from,
        uint256 tokenId,
        bytes calldata data
    ) external override returns (bytes4) {
        // console.log("onERC721Received", operator, from, tokenId, data);
        return this.onERC721Received.selector;
    }
}
