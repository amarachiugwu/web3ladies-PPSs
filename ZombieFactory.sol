//SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.6.0;

//Functions
//structs
//arrays
//events
//uint
//string
//contract statement
//mapping
//prama statement
//modifiers
//License modifiers
//interfaces


contract ZombieFactory {

    uint dnaDigit = 16;
    uint dnaModulus = 10 ** dnaDigit;

    // string name;

    struct Zombie {
        string name;
        uint dnaDigit;
    }

    Zombie[] public zombies;

    event newZombie(uint id, string name,uint dna);

    function _createZombie (string memory _name, uint _dnaDigit) private {
        uint id = zombies.push(Zombie(_name, _dnaDigit)) - 1;
        emit newZombie(id, _name, _dnaDigit);
    }

    function _createRandomDna (string memory _str) private view returns (uint) {
        uint rand = uint(keccak256(abi.encodePacked(_str)));
        rand = rand % dnaModulus;
        return rand;
    }

    function createRandomZombie (string memory _name)  public {
        uint dna =  _createRandomDna(_name);
        _createZombie(_name, dna);
    }

}
