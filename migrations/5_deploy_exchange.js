const GCCExchangeCore = artifacts.require("GCCExchangeCore");

module.exports = function(deployer, network, accounts) {
    deployer.deploy(GCCExchangeCore, {from: accounts[0]});
};