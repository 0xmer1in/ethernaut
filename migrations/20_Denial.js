const DenialHack = artifacts.require("DenialHack");

module.exports = async function (deployer) {
    await deployer.deploy(DenialHack);
    denialHackInstance = await DenialHack.deployed();
    await denialHackInstance.setWithdrawPartner();
}
