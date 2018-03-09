const GoCrypobotNftCore = artifacts.require("GoCryptobotNftCore");

module.exports = function(deployer, network, accounts) {
    deployer.deploy(GoCrypobotNftCore);
};
