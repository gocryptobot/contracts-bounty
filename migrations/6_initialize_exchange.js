const GoCrypobotCoinCore = artifacts.require("GoCryptobotCoinCore");
const GCCExchangeCore = artifacts.require("GCCExchangeCore");

module.exports = async function(deployer, network, accounts) {
    const coin = await GoCrypobotCoinCore.deployed();
    const exchange = await GCCExchangeCore.deployed();

    exchange.setCoinContract(coin.address, {from: accounts[0]});
    exchange.unpause({from: accounts[0]});
};