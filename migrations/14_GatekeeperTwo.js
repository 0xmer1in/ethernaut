const GatekeeperTwoHack = artifacts.require("GatekeeperTwoHack");

module.exports = async function (deployer) {
    await deployer.deploy(GatekeeperTwoHack);
    gatekeeperTwoHackInstance = await GatekeeperTwoHack.deployed();
}
