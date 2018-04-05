pragma solidity ^0.4.18;

import "./GoCryptobotScore.sol";

contract GoCryptobotRounds is GoCryptobotScore {
    event RoundFinished(EventType eventType, EventColor eventMajorColor, EventColor eventMinorColor, uint scoreA, uint scoreB, uint scoreC, uint scoreD);
    event AllFinished(uint scoreA, uint scoreB, uint scoreC, uint scoreD);
    event WinnerTeam(uint8[4] candidates, uint8 winner);

    function run(bytes playerData, uint8[4] eventTypes, uint8[2][4] eventColors) public onlyOperator {
        require(playerData.length == 128 * PLAYER_SIZE);

        _initRandom();

        uint8[] memory colorSelection = new uint8[](8);
        colorSelection[0] = 0;
        colorSelection[1] = 1;
        colorSelection[2] = 0;
        colorSelection[3] = 1;
        colorSelection[4] = 0;
        colorSelection[5] = 1;
        colorSelection[6] = 0;
        colorSelection[7] = 1;

        _shuffle(colorSelection);

        uint[4] memory totalScores;
        for (uint8 i = 0; i < 4; i++) {
            uint8 majorColor = eventColors[i][colorSelection[i]];
            uint8 minorColor = eventColors[i][colorSelection[i]^1];
            uint[4] memory roundScores = _round(playerData, EventType(eventTypes[i]), EventColor(majorColor), EventColor(minorColor));
            totalScores[0] += roundScores[0];
            totalScores[1] += roundScores[1];
            totalScores[2] += roundScores[2];
            totalScores[3] += roundScores[3];
        }
        AllFinished(totalScores[0], totalScores[1], totalScores[2], totalScores[3]);

        uint maxScore;
        uint maxCount;
        uint8[4] memory candidates;
        for (i = 0; i < 4; i++) {
            if (maxScore < totalScores[i]) {
                maxScore = totalScores[i];
                maxCount = 0;
                candidates[maxCount++] = i + 1;
            } else if (maxScore == totalScores[i]) {
                candidates[maxCount++] = i + 1;
            }
        }
        assert(maxCount > 0);
        if (maxCount == 1) {
            WinnerTeam(candidates, candidates[0]);
        } else {
            WinnerTeam(candidates, candidates[_random256() % maxCount]);
        }
    }

    function _round(bytes memory playerData, EventType eventType, EventColor eventMajorColor, EventColor eventMinorColor) internal returns(uint[4]) {
        uint numOfPlayers = playerData.length / PLAYER_SIZE;
        uint[4] memory scores;
        for (uint i = 0; i < numOfPlayers; i++) {
            scores[i / (numOfPlayers / 4)] += _getPlayerEventScore(playerData, i, eventType, eventMajorColor, eventMinorColor);
        }
        RoundFinished(eventType, eventMajorColor, eventMinorColor, scores[0], scores[1], scores[2], scores[3]);
        return scores;
    }
}
