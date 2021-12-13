const web3 = require("web3");
const ForceHack = artifacts.require("ForceHack");

module.exports = async function (deployer) {
    await deployer.deploy(ForceHack, {value: web3.utils.toWei('0.00001')});
    forceHackInstance = await ForceHack.deployed();
    await forceHackInstance.forceTransfer();
}
