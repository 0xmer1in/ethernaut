// const CoinFlip = artifacts.require("CoinFlip");
const CoinFlipHack = artifacts.require("CoinFlipHack");

module.exports = async function (deployer) {
  // await deployer.deploy(CoinFlip);
  // coinFlipInstance = await CoinFlip.deployed();
  // await deployer.deploy(CoinFlipHack, coinFlipInstance.address);
  await deployer.deploy(CoinFlipHack, '0x2fd852b45095fF6048B6Cc42883959d44F4aB521');
  coinFlipHackInstance = await CoinFlipHack.deployed();
  consecutiveWins = await coinFlipHackInstance.getConsecutiveWins();
  console.log(consecutiveWins);
  for (i = 0; i < 10 - consecutiveWins; i++) {
    await coinFlipHackInstance.flip();
  }
};
