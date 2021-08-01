const GET = artifacts.require("HTTPapiGET");

module.exports = function (deployer) {
  deployer.deploy(GET);
};
