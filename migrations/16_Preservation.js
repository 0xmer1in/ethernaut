const PreservationHack = artifacts.require("PreservationHack");

module.exports = async function (deployer) {
    await deployer.deploy(PreservationHack);
    preservationHackInstance = await PreservationHack.deployed();
    await preservationHackInstance.setTimeZone1Library();
}
