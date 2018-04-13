pragma solidity ^0.4.18;

import "./GoCryptobotCoinERC827.sol";
import "./GCCExchangeAccessControl.sol";

contract GCCExchangeCoinOperation is GCCExchangeAccessControl {
    GoCryptobotCoinERC827 internal coin;

    function setCoinContract(address _address) external onlyOwnerOrOperator {
        GoCryptobotCoinERC827 _contract = GoCryptobotCoinERC827(_address);
        coin = _contract;
    }

    function unpause() public {
        require(coin != address(0));
        super.unpause();
    }

    function operate(bytes data) external onlyOwnerOrOperator {
        require(coin.call(data));
    }
}
