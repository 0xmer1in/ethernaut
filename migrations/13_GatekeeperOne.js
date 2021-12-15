const GatekeeperOneHack = artifacts.require("GatekeeperOneHack");

module.exports = async function (deployer) {
    await deployer.deploy(GatekeeperOneHack);
    gatekeeperOneHackInstance = await GatekeeperOneHack.deployed();
    await gatekeeperOneHackInstance.enter();
}
