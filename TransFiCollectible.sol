// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract TransFiCollectible is ERC721 {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    uint256 public maxNFTsPerWallet = 5;

    constructor() ERC721("TransFi Collectible", "TFC") {}

 // Aquí se aplica la condición
    function mintCollectible(address recipient) public returns (uint256) {
        require(
            balanceOf(recipient) < maxNFTsPerWallet,
            "Solo puedes tener hasta 5 TFC (coleccionables)"
        );

        _tokenIds.increment();
        uint256 newItemId = _tokenIds.current();
        _mint(recipient, newItemId);

        return newItemId;
    }
}
