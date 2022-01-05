const MotorbikeHack = artifacts.require("MotorbikeHack");

module.exports = async function (deployer) {
    await deployer.deploy(MotorbikeHack);
    motorbikeHackInstance = await MotorbikeHack.deployed();
    await motorbikeHackInstance.attack();
}
