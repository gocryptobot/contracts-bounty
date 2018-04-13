pragma solidity ^0.4.18;

import "./GCCExchangeCoinOperation.sol";

contract GCCExchangeCore is GCCExchangeCoinOperation {
    uint8 constant FEE_RATE = 5;
    address internal coinStorage;

    event Withdrawal(address claimant, uint256 mgccAmount, uint256 weiAmount);

    function GCCExchangeCore() public {
        coinStorage = this;

        paused = true;

        owner = msg.sender;
        operator = msg.sender;
    }

    function setCoinStorage(address _address) public onlyOwnerOrOperator {
        coinStorage = _address;
    }

    function withdraw(address _claimant, uint256 _mgcc) public whenNotPaused {
        require(coin.allowance(_claimant, this) >= _mgcc);
        require(coin.transferFrom(_claimant, coinStorage, _mgcc));
        uint256 exchange = (_convertToWei(_mgcc) / 100) * (100 - FEE_RATE);
        _claimant.transfer(exchange);
        Withdrawal(_claimant, _mgcc, exchange);
    }

    function _convertToWei(uint256 mgcc) internal pure returns (uint256) {
        // 1000 GCC = 1000000 mGCC = 1 ETH        = 1000000000000000000 wei
        //    1 GCC =    1000 mGCC = 0.001 ETH    =    1000000000000000 wei
        //                  1 mGcc = 0.000001 ETH =       1000000000000 wei
        return mgcc * 1000000000000 wei;
    }

    function () external payable {
        revert();
    }
}
