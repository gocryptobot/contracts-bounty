# Bug Bounty Program

Take part in our bounty program and help GoCryptobot become a killer blockchain game. 

[GoCryptobot](http://gocryptobot.io/) is an Ethereum-based mobile game fully playable on mobile. You can have 100% ownership of the in-game characters, upgrade them on run mode, trade them at the in-game exchange, and even have them battle on PvP mode. Join GoCryptobot, a fun and rewarding game that allows transparent and safe transactions among players. All this is possible on your mobile.

In order to keep our smart contracts safe from security vulnerabilities, we have decided to split our bug bounty program into two phases. The first bug bounty program aims to find vulnerabilities in our in-game currency (ERC20) and in our game items (ERC721), whereas the second one aims to find issues in the smart contracts used in PvP mode and at the ERC20 exchange. You can join either or both of them by only sending us a pull request on Github. 

## Bug Bounty Program 1 (closed)

- Period:  March 10~16th, 2018

- Smart contract 1: ERC20

GCC (ERC20) is an in-game currency used in GoCryptobot

- Smart contract 2: ERC721

GoCryptobot is a story about AI-installed robots that run from their exploiter humans in search for their creator, Doctor Z. The robots are composed of 4 parts: head, body, legs and buster which are upgraded throughout the game. Each part of the robot is a non-fungible token that complies with the ERC 721 specification. This means that the player has 100% ownership of the parts, trade and exchange them with other people even outside the game. At Kodebox, we are also developing a follow-up game where the player has the choice of using the same robots that he/she is using in GoCryptobot. 

### Bug Classification

Bugs are classified into 3 levels: P1 (high), P2 (medium) and P3 (low)

- P1 (high):  a security vulnerability that will result in loss of value
  
  e.g. Steal ERC20/721 tokens from someone, mint tokens at your discretion

- P2 (medium): a security vulnerability that will not result in loss of value but can result in a showstopper of the game

  e.g. Block actions for all users

- P3 (low):  a security vulnerability that will not result in loss of value but can cause great inconvenience for some fraction of users

  e.g. Block a user from transferring tokens

### Bug Report Process

Send us a [pull request on our Github repository](https://github.com/gocryptobot/contracts-bounty/pulls).
We trust you are a decent developer with common sense, so actions such as reporting issues already reported by others, issues that are out of scope, abusive behavior, personal attacks, etc will be completely ignored. Please, be reminded that we will review the issues and assess if they fall into the bugs classification at our own discretion. 

Every contributor that has reported a bug that can be classified as P1, P2 and P3 issues will be rewarded. Please, use Github accounts that you own and use, so that we can contact you when we need your wallet address for sending the compensations.

- P1 (high): 1 ETH 
- P2 (medium): 0.5 ETH 
- P3 (low): 0.3 ETH 

## Bug Bounty Program 2

- Period: April 15th ~ 21st, 2018 (it closes at 23:59pm KST)

### Smart contract 1: PvP mode

#### Background Information 1: admission condition

Each PvP match admits 128 cryptobots. The match is a competition among 4 teams and each teams has 32 cryptobots. The player has to choose one team to participate. Only the cryprotobots with their all 4 parts higher than level 5 are eligible for the match.

#### Background Information 2: rules

* PvP points

The part of the cryptobot that you’re using for the match (either head, body, legs or booster) will be given points depending on its level. The total team score will be the sum of the points of each cryptobot. This means the higher level your cryptobot part is, the higher your contribution to the team. For example, AI is required for the PvP bowling match, so the level of the head of each cryptobot will determine the number of points. Tug-of-war requires strength (body part), racing requires speed (legs part), and high jumping requires power (booster part).

* Lucky color

Each match has two lucky colors; this is an information that is given to the players prior to the match. The smart contract chooses one as the luckier color (the probability is 0.5). Those parts that match the lucky color get extra points and the parts that match the lucky color chosen by the smart contract get additional extra points.

#### Points calculation (actual smart contract)

The total number of points that a part contributes is the sum of:  
   `Part’s level`  
   \+ `the sum of the skill level, if the part has either of the two lucky colors`  
   \+ `the sum of the skill level, if the part has either of the two lucky colors and the cryptobot has theme effect`  
   \+ `the sum of the skill level multiplied by 2, if the part has the lucky color chosen by the smart contract`  


### Smart contract 2: ERC20 exchange

GoCryptobot’s in-game currency is GCC which is pegged to ETH at 1:1000 ratio (1 ETH = 1000 GCC).
Players can withdraw GCC from the game to their personal wallet. Whenever they want, they can exchange to ETH. The exchange commission is 5%.

### Bug Classification

Bugs are classified into 3 levels: P1 (high), P2 (medium) and P3 (low)

- P1 (high):  a security vulnerability that will result in loss of value

  e.g. Steal ERC20/721 tokens from someone, mint tokens at your discretion

- P2 (medium): a security vulnerability that will not result in loss of value but can result in a showstopper of the game

  e.g. Block actions for all users

- P3 (low):  a security vulnerability that will not result in loss of value but can cause great inconvenience for some fraction of users

  e.g. Block a user from transferring tokens

### Bug Report Process

Send us a [pull request on our Github repository](https://github.com/gocryptobot/contracts-bounty/pulls).
We trust you are a decent developer with common sense, so actions such as reporting issues already reported by others, issues that are out of scope, abusive behavior, personal attacks, etc will be completely ignored. Please, be reminded that we will review the issues and assess if they fall into the bugs classification at our own discretion.

Every contributor that has reported a bug that can be classified as P1, P2 and P3 issues will be rewarded. Please participate with a Github account that you own and use, so that we can contact you to send you the reward.

- P1 (high): 3 ETH
- P2 (medium): 2 ETH
- P3 (low): 1 ETH
