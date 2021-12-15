const ElevatorHack = artifacts.require("ElevatorHack");

module.exports = async function (deployer) {
    await deployer.deploy(ElevatorHack);
    elevatorHackInstance = await ElevatorHack.deployed();
    await elevatorHackInstance.goTo();
}
