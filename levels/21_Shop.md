```shell
# Reference: https://cyanwingsbird.blog/solidity/ethernaut/21-shop/
# Notice: Always remember the order of code execution
truffle migrate --network rinkeby --f 21 --to 21
```

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

interface Buyer {
  function price() external view returns (uint);
}

contract Shop {
  uint public price = 100;
  bool public isSold;

  function buy() public {
    Buyer _buyer = Buyer(msg.sender);

    if (_buyer.price{gas:3300}() >= price && !isSold) {
      isSold = true;
      price = _buyer.price{gas:3300}();
    }
  }
}
```
