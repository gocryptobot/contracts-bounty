pragma solidity ^0.4.18;

import "./GoCryptobotRandom.sol";

contract GoCryptobotScore is GoCryptobotRandom {
    // A part's skill consists of color and level. (Total 2 bytes)
    //   1   2
    // Skill
    // +---+---+
    // | C | L +
    // +---+---+
    //
    // C = Color, 0 ~ 4.
    // L = Level, 0 ~ 8.
    //
    uint256 constant PART_SKILL_SIZE = 2;

    // A part consists of level and 3 skills. (Total 7 bytes)
    //   1   2   3   4   5   6   7
    // Part
    // +---+---+---+---+---+---+---+
    // | L | Skill | Skill | Skill |
    // +---+---+---+---+---+---+---+
    //
    // L = Level, 1 ~ 50.
    //
    // A part doesn't contains color because individual color doesn't affect to
    // the score, but it is used to calculate player's theme color.
    //
    uint256 constant PART_BASE_SIZE = 1;
    uint256 constant PART_SIZE = PART_BASE_SIZE + 3 * PART_SKILL_SIZE;

    // A player consists of theme effect and 4 parts. (Total 29 bytes)
    //   1   2   3   4   5   6   7
    // Player
    // +---+
    // | C |
    // +---+---+---+---+---+---+---+
    // |         HEAD PART         |
    // +---+---+---+---+---+---+---+
    // |         BODY PART         |
    // +---+---+---+---+---+---+---+
    // |         LEGS PART         |
    // +---+---+---+---+---+---+---+
    // |         BOOSTER PART      |
    // +---+---+---+---+---+---+---+
    //
    // C = Whether player's theme effect is enabled or not, 1 or 0.
    //
    // The theme effect is set to 1 iff the theme of each part are identical.
    //
    uint256 constant PLAYER_BASE_SIZE = 1;
    uint256 constant PLAYER_SIZE = PLAYER_BASE_SIZE + PART_SIZE * 4;

    enum PartType {HEAD, BODY, LEGS, BOOSTER}
    enum EventType {BOWLING, HANGING, SPRINT, HIGH_JUMP}
    enum EventColor {NONE, YELLOW, BLUE, GREEN, RED}

    function _getPartLevel(bytes data, uint partOffset) internal pure returns(uint8) {
        return uint8(data[partOffset + 0]);
    }
    // NOTE: _getPartSkillColor is called up to 128 * 4 * 3 times. Explicit
    // conversion to EventColor could be costful.
    function _getPartSkillColor(bytes data, uint partOffset, uint skillIndex) internal pure returns(byte) {
        return data[partOffset + PART_BASE_SIZE + (skillIndex * PART_SKILL_SIZE) + 0];
    }
    function _getPartSkillLevel(bytes data, uint partOffset, uint skillIndex) internal pure returns(uint8) {
        return uint8(data[partOffset + PART_BASE_SIZE + (skillIndex * PART_SKILL_SIZE) + 1]);
    }

    function _getPlayerThemeEffect(bytes data, uint playerOffset) internal pure returns(byte) {
        return data[playerOffset + 0];
    }

    function _getPlayerEventScore(bytes data, uint playerIndex, EventType eventType, EventColor _eventMajorColor, EventColor _eventMinorColor) internal pure returns(uint) {
        uint partOffset = (PLAYER_SIZE * playerIndex) + PLAYER_BASE_SIZE + (uint256(eventType) * PART_SIZE);
        uint level = _getPartLevel(data, partOffset);
        uint majorSkillSum = 0;
        uint minorSkillSum = 0;

        byte eventMajorColor = byte(uint8(_eventMajorColor));
        byte eventMinorColor = byte(uint8(_eventMinorColor));
        for (uint i = 0; i < 3; i++) {
            byte skillColor = _getPartSkillColor(data, partOffset, i);
            if (skillColor == eventMajorColor) {
                majorSkillSum += _getPartSkillLevel(data, partOffset, i);
            } else if (skillColor == eventMinorColor) {
                minorSkillSum += _getPartSkillLevel(data, partOffset, i);
            }
        }
        byte playerThemeEffect = _getPlayerThemeEffect(data, PLAYER_SIZE * playerIndex);
        if (playerThemeEffect != 0) {
            return level + (majorSkillSum * 4) + (minorSkillSum * 2);
        } else {
            return level + (majorSkillSum * 3) + (minorSkillSum * 1);
        }
    }
}
