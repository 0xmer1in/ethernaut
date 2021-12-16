```javascript
await contract.approve(player, toWei("1000000"))
await contract.transferFrom(player, contract.address, toWei("1000000"))
```