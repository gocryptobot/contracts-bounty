pragma solidity ^0.4.18;

contract GoCryptobotAccessControl {
    address public owner;
    address public operator;

    bool public paused;

    modifier onlyOwner() {require(msg.sender == owner); _;}
    modifier onlyOperator() {require(msg.sender == operator); _;}
    modifier onlyOwnerOrOperator() {require(msg.sender == owner || msg.sender == operator); _;}

    modifier whenPaused() {require(paused); _;}
    modifier whenNotPaused() {require(!paused); _;}

    function transferOwnership(address newOwner) public onlyOwner {
        require(newOwner != address(0));
        owner = newOwner;
    }

    function transferOperator(address newOperator) public onlyOwner {
        require(newOperator != address(0));
        operator = newOperator;
    }

    function pause() public onlyOwnerOrOperator whenNotPaused {
        paused = true;
    }

    function unpause() public onlyOwner whenPaused {
        paused = false;
    }
}