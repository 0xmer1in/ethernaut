pragma solidity 0.6.12;

interface ICoinFlip {
    function FACTOR() external returns (uint256);
    function flip(bool) external returns (bool);
}

contract CoinFlipHack {
    ICoinFlip public coinFlip = ICoinFlip(0x2fd852b45095fF6048B6Cc42883959d44F4aB521);
    // TODO not finish yet
}
