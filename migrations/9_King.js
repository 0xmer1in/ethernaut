const web3 = require("web3");
const KingHack = artifacts.require("KingHack");

module.exports = async function (deployer) {
    await deployer.deploy(KingHack);
    kingHackInstance = await KingHack.deployed();
    await kingHackInstance.transferETH({value: web3.utils.toWei('1.1')});
}
