pragma solidity ^0.4.18;

import "./GoCryptobotNftBurnable.sol";

contract GoCryptobotNftCore is GoCryptobotNftBurnable {

    function GoCryptobotNftCore() public {
        paused = false;

        owner = msg.sender;
        operator = msg.sender;
    }

    // Users may have accidentally sent to our address
    function rescueLostToken(uint256 _tokenId, address _to) public onlyOperator {
        clearApprovalAndTransfer(this, _to, _tokenId);
    }

    function () public payable {
        revert();
    }
}
