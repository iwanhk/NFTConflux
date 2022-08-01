// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

import "@openzeppelin/contracts/utils/Strings.sol";
import "../conflux_lib/token/CRC721/extensions/CRC721Enumerable.sol";
import "../conflux_lib/InternalContracts/InternalContractsHandler.sol";

contract NFT721 is CRC721Enumerable {
    using Strings for uint256;
    string public baseUIR;
    constructor(string memory _base) ERC721("NFT721", "NFT721") {
        baseUIR= _base;
    }

    function mint(address to, uint256 amount) external {
        _mint(to, amount);
    }

    function _baseURI() internal view virtual override returns (string memory) {
        return baseUIR;
    }

    function tokenURI(uint256 tokenId) public view virtual override returns (string memory) {
        require(_exists(tokenId), "nonexistent token");

        string memory baseURI = _baseURI();
        return string(abi.encodePacked(baseURI, tokenId.toString(), ".json"));
    }

    function sponsor() external payable {
        InternalContracts.SPONSOR_CONTROL.setSponsorForGas{value: msg.value}(address(this), 1e9);
    }
}
