pragma solidity ^0.4.18;

import "./GoCryptobotAccessControl.sol";

contract GoCryptobotRandom is GoCryptobotAccessControl {
    uint commitmentNumber;
    bytes32 randomBytes;

    function commitment() public onlyOperator {
        commitmentNumber = block.number;
    }

    function _initRandom() internal {
        require(commitmentNumber < block.number);

        if (commitmentNumber < block.number - 255) {
            randomBytes = block.blockhash(block.number - 1);
        } else {
            randomBytes = block.blockhash(commitmentNumber);
        }
    }

    function _shuffle(uint8[] deck) internal {
        require(deck.length < 256);

        uint8 deckLength = uint8(deck.length);
        uint8 random;
        for (uint8 i = 0; i < deckLength; i++) {
            if (i % 32 == 0) {
                randomBytes = keccak256(randomBytes);
            }
            random = uint8(randomBytes[i % 32]) % (deckLength - i);

            if (random != deckLength - 1 - i) {
                deck[random] ^= deck[deckLength - 1 - i];
                deck[deckLength - 1 - i] ^= deck[random];
                deck[random] ^= deck[deckLength - 1 - i];
            }
        }
    }

    function _random256() internal returns(uint256) {
        randomBytes = keccak256(randomBytes);
        return uint256(randomBytes);
    }
}