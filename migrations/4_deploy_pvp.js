const GoCryptobotCore = artifacts.require("GoCryptobotCore");

module.exports = function(deployer, network, accounts) {
    deployer.deploy(GoCryptobotCore);
};
