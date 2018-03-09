pragma solidity ^0.4.18;

import "./GoCryptobotCoinERC827.sol";

contract GoCryptobotCoinCore is GoCryptobotCoinERC827 {
    function GoCryptobotCoinCore() public {
        balances[msg.sender] = 1000000000 * (10 ** uint(decimals));
        totalSupply_.add(balances[msg.sender]);
    }

    function () public payable {
        revert();
    }
}
