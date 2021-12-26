const ShopHack = artifacts.require("ShopHack");

module.exports = async function (deployer) {
    await deployer.deploy(ShopHack);
    shopHackInstance = await ShopHack.deployed();
    await shopHackInstance.buy();
}
