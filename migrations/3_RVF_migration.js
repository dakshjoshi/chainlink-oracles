const RandomNumber = artifacts.require("RandomNumbers");

module.exports = function (deployer) {
  deployer.deploy(RandomNumber);
};
