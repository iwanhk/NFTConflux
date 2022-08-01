// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

import "conflux_lib/token/CRC1155/presets/CRC1155PresetAutoId.sol";
import "../conflux_lib/InternalContracts/InternalContractsHandler.sol";

contract NFT1155 is Ownable, CRC1155PresetAutoId {
    using Strings for uint256;

    constructor(string memory _uri) CRC1155PresetAutoId(_uri) {}

    // *****************************************************************************
    // Public Functions

    function mint(address to, uint256 amount) external {
        mint(to, amount, '');
    }
    // Public Views
    // ****************************************************************************

    function uri(uint256 tokenId) public view virtual override returns (string memory){
        require(tokenId< totalSupply(), "nonexistent token");

        return string(abi.encodePacked(super.uri(tokenId), tokenId.toString(), ".json"));
    }

    // Contract Controls (onlyOwner)
    // *****************************************************************************


    function _setBaseURI(string memory newuri) external  onlyOwner{
        _setURI(newuri);
    }

    function sponsor() external payable {
        InternalContracts.SPONSOR_CONTROL.setSponsorForGas{value: msg.value}(address(this), 1e9);
    }
}
