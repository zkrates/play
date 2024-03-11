// SPDX-License-Identifier: Unlicensed
pragma solidity ^0.8.19;

contract GuessTheNumber {
    uint public lastNumber;
    enum Guess { Greater, Smaller, Equal }

    constructor() {
        lastNumber = random();
    }

    function guess(Guess guess) public view returns (bool win) {
        uint newNumber = random();
        if (guess == Guess.Greater) {
            return newNumber > lastNumber;
        } else if (guess == Guess.Smaller) {
            return newNumber < lastNumber;
        } else if (guess == Guess.Equal) {
            return newNumber == lastNumber;
        }
    }

    function random() private view returns (uint) {
        return uint(keccak256(abi.encodePacked(block.timestamp, block.difficulty))) % 11;
    }
}
