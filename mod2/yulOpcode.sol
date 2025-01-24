// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.4;

contract OpcodeGas {

    function somaEmSolidity (uint256 _a, uint256 _b) external pure returns (uint256) {
        uint256 soma = _a + _b;
        return soma;
    }

    function somaEmOpcode (uint256 _a, uint256 _b) external pure returns (uint256 result) {
        
        assembly {
            result := add(_a,_b)
        }

        return result;
    }
}