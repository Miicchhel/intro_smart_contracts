// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Construct {
    string public nome;
    uint256 immutable idade;
    address public constant owner = 0x777788889999AaAAbBbbCcccddDdeeeEfFFfCcCc;

    constructor(string memory _nome, uint256 _idade) {
        nome = _nome;
        idade = _idade;
    }

    function getNome() public view returns (string memory) {
        return nome;
    }

    function setNome(string memory _nome) external {
        require(msg.sender == owner, "Somente o dono pode alterar o nome");
        nome = _nome;
    }
}