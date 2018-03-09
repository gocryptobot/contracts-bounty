# ERC20: GoCryptobotCoin (GCC)

ERC20-compatible token

 * Roles: User

 1. Users can use ERC20 and ERC827 functions
 1. The contract doesn't receive any Ether
 1. The total supply is fixed to 1,000,000,000 GCC at creation
 1. The smallest unit of GCC is 0.001 GCC

# ERC721: GoCryptobotNft

ERC721-compatible token

 * Roles: Owner, Operator, User

 1. Users can use ERC721 functions
 1. The contract doesn't receive any Ether
 1. The owner can transfer ownership
 1. The owner can replace the operator
 1. The operator can mint a new token
 1. The owner or the operator can pause entire actions of users
 1. The owner can unpause

# Deployment

It is recommended to run using [Truffle 4 framework](http://truffleframework.com/). The migration settings are provided.

Run the development network: `truffle develop`

Deploy the contracts: `truffle migrate`

