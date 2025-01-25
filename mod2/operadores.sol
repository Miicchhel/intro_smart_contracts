// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Operadores {
    uint256 valor;

    function calcularMedia(uint _a, uint _b) public pure returns (uint256) {
        uint256 result = (_a + _b) / 2;
        return result;
    }

    function calcularMultiplicacao(uint256 _a, uint256 _b) public pure returns (uint256) {
        uint256 result = _a * _b;
        return result;
    }

    function verificaConjuncao(bool _a, bool _b) public pure returns (bool) {
        bool result = _a && _b;
        return result;
    }

    function verificaDisjuncao(bool _a, bool _b) public pure returns (bool) {
        bool result = _a || _b;
        return result;
    }

    function verificarMaior(uint256 _a, uint256 _b) public pure returns (bool) {
        bool result = _a > _b;
        return result;
    }

    function verificarIgual(uint256 _a, uint256 _b) public pure returns (bool) {
        bool result = _a == _b;
        return result;
    }

    function verificarDiferente(uint256 _a, uint256 _b) public pure returns (bool) {
        bool result = _a != _b;
        return result;
    }

    function setValor(uint256 _valor) public {
        if (_valor >= 10) {
            valor = _valor;
        } else if (_valor > 0 && _valor <= 5 ){
            valor = _valor - 1;
        } else {
            valor = 0;
        }
    }

    function getValor() public view returns (uint256) {
        return valor;
    } 
}