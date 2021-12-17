const RecoveryHack = artifacts.require("RecoveryHack");

module.exports = async function (deployer) {
    await deployer.deploy(RecoveryHack);
    recoveryHackInstance = await RecoveryHack.deployed();
    await recoveryHackInstance.destroy();
}
