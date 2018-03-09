const SafeMath = artifacts.require("SafeMath");
const GoCrypobotCoinCore = artifacts.require("GoCryptobotCoinCore");

module.exports = function(deployer, network, accounts) {
    deployer.deploy(SafeMath);
    deployer.link(SafeMath, GoCrypobotCoinCore);
    deployer.deploy(GoCrypobotCoinCore, {from: accounts[0]});
};
