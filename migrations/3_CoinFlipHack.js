const CoinFlipHack = artifacts.require("CoinFlipHack");

module.exports = async function (deployer) {
  await deployer.deploy(CoinFlipHack);
  coinFlipHackInstance = await CoinFlipHack.deployed();
  consecutiveWins = await coinFlipHackInstance.getConsecutiveWins();
  console.log(consecutiveWins);
  for (i = 0; i < 10 - consecutiveWins; i++) {
    await coinFlipHackInstance.flip();
  }
};
