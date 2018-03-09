pragma solidity ^0.4.18;

import "./GoCryptobotNftOwnership.sol";

contract GoCryptobotNftMintable is GoCryptobotNftOwnership {
    function mint(address _to, uint256 _tokenId) public onlyOperator {
        _mint(_to, _tokenId);
    }
}