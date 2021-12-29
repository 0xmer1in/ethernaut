const DexTwoHack = artifacts.require("DexTwoHack");

module.exports = async function (deployer) {
    await deployer.deploy(DexTwoHack);
    dexTwoHackInstance = await DexTwoHack.deployed();
    await dexTwoHackInstance.swap();
}
