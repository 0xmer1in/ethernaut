const TelephoneHack = artifacts.require("TelephoneHack");

module.exports = async function (deployer) {
    await deployer.deploy(TelephoneHack);
    telephoneHackInstance = await TelephoneHack.deployed();
    await telephoneHackInstance.changeOwner();
}
