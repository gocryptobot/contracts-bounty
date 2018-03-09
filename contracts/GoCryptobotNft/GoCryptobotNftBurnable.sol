pragma solidity ^0.4.18;

import "./GoCryptobotNftMintable.sol";

contract GoCryptobotNftBurnable is GoCryptobotNftMintable {
    function burn(uint256 _tokenId) public onlyOwnerOf(_tokenId) whenNotPaused {
        _burn(_tokenId);
    }
}
