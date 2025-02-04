// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/utils/Strings.sol";

contract funcoesExemplo {
    uint256 public numero;
    string public nome;
    string public mensagem;
    uint256 constant SCALE = 1e18;

    uint256 valor;
    
    // função interna só pode ser chamada pelo contrato
    function setNumero(uint256 _numero) internal {
        uint256 subNumero = (_numero*SCALE) / 2;
        numero = subNumero;
    }

    // funções públicas podem ser chamadads por contas EOAs ou Contrato
    function setMsg(string memory _msg) public {
    mensagem = _msg;
    }

    // funções externas são as que só podem ser chamadas por contas EOAs endereços ... 
    function setNomeENumero(string memory _nome, uint256 _numero) external  {
        nome = _nome;
        setNumero(_numero);
        setMsg("Chamou pelo contrato");
    }

    function setValor(uint _valor) external  {
        valor = _valor;
    }

    function getValor() external view returns (string memory) {
        uint inteiro = numero / SCALE;
        uint decimal = numero % SCALE;
        
        // Formata como "inteiro.decimal"
        return string(abi.encodePacked(Strings.toString(inteiro), ".", formatDecimal(decimal)));
    }

    function formatDecimal(uint256 decimal) internal pure returns (string memory) {
        // Se o decimal for menor que 10, adiciona um zero à esquerda
        if (decimal < 10) {
            return string(abi.encodePacked("0", Strings.toString(decimal)));
        }
        return Strings.toString(decimal);
    }


    function multiplicar(uint x, uint y) external pure returns (uint256) {
        uint valorMultiplicacao = x * y;
        return valorMultiplicacao;
    }

    function payEther() external payable  { }
}