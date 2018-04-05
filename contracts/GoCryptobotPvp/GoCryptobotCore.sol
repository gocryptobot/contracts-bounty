pragma solidity ^0.4.18;

import "./GoCryptobotRounds.sol";

contract GoCryptobotCore is GoCryptobotRounds {
    function GoCryptobotCore() public {
        paused = false;

        owner = msg.sender;
        operator = msg.sender;
    }
}