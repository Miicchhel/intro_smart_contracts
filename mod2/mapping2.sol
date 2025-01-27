// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract MappingWithArray {
    mapping (address => uint256) public balances;
    mapping (address => bool) public inserido;
    address[] public contas;

    function setConta(address _conta, uint256 _valor) external {
        // if (!inserido[_conta]) {
        //     inserido[_conta] = true;
        //     contas.push(_conta);
        // }
        require(!inserido[_conta], "Conta ja cadastrada");
        balances[_conta] = _valor;
        inserido[_conta] = true;
        contas.push(_conta);
    }

    function getSize () external view returns (uint256) {
        return contas.length;
    }

    function getFirstBalance () external view returns (uint256) {
        require(contas.length > 0, "A primeira conta ainda nao foi cadastrada");
        return balances[contas[0]];
    }

    function getLastBalance() external view returns (uint256) {
        uint256 totalContas = contas.length;
        require(totalContas > 0, "Nao ha contas cadastradas");
        return balances[contas[totalContas - 1]];
    }
}