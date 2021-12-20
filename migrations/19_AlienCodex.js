const AlienCodexHack = artifacts.require("AlienCodexHack");

module.exports = async function (deployer) {
    await deployer.deploy(AlienCodexHack);
    alienCodexHackInstance = await AlienCodexHack.deployed();
    await alienCodexHackInstance.attack();
}
