const PuzzleWalletHack = artifacts.require("PuzzleWalletHack");

module.exports = async function (deployer) {
    await deployer.deploy(PuzzleWalletHack);
    puzzleWalletHackInstance = await PuzzleWalletHack.deployed();
    await puzzleWalletHackInstance.proposeNewAdmin();
}
