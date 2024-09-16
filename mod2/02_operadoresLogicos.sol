// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract Operadores {
    uint256 valor; // Variável de estado para armazenar um valor

    // Função para calcular a média de dois números
    function calcularMedia(uint256 _a, uint256 _b) public pure returns(uint256) {
        uint256 resultado = (_a + _b) / 2; // Calcula a média
        return resultado;
    }

    // Função para calcular a multiplicação de dois números
    function calcularMultiplicacao(uint256 _a, uint256 _b) public pure returns(uint256) {
        uint256 resultado = _a * _b; // Calcula o produto
        return resultado;
    }

    // Função para verificar o operador lógico AND
    function verificarAND(bool _a, bool _b) public pure returns(bool) {
        bool resultado = _a && _b; // Verifica se ambos são verdadeiros
        return resultado;
    }

    // Função para verificar o operador lógico OR
    function verificarOR(bool _a, bool _b) public pure returns(bool) {
        bool resultado = _a || _b; // Verifica se pelo menos um é verdadeiro
        return resultado;
    }

    // Função para verificar se um número é maior que o outro
    function verificarMaior(uint256 _a, uint256 _b) public pure returns (bool) {
        bool resultado = _a > _b; // Verifica se _a é maior que _b
        return resultado;
    }

    // Função para verificar se dois números são iguais
    function verificarIgual(uint256 _a, uint256 _b) public pure returns (bool) {
        bool resultado = _a == _b; // Verifica se _a é igual a _b
        return resultado;
    }

    // Função para verificar se dois números são diferentes
    function verificarDiferente(uint256 _a, uint256 _b) public pure returns (bool) {
        bool resultado = _a != _b; // Verifica se _a é diferente de _b
        return resultado;
    }

    // Função para definir o valor da variável de estado
    function setValor(uint256 _novoValor) public {
        if (_novoValor >= 10) {
            valor = _novoValor; // Define o valor se _novoValor for maior ou igual a 10
        } else {
            valor = 0; // Define o valor como 0 caso contrário
        }
    }

    // Função para retornar o valor da variável de estado
    function getValor() public view returns (uint256) {
        return valor; // Retorna o valor armazenado
    }
}

/*
Sobre os modificadores, lembre-se:

- public: Indica que a função pode ser chamada tanto de fora do contrato quanto internamente dentro do contrato. É o modificador de visibilidade padrão e permite acesso amplo.

pure: Usado em funções que não leem nem alteram o estado do contrato. Essas funções apenas realizam cálculos com os parâmetros fornecidos e não dependem do estado armazenado no contrato.

view: Usado em funções que leem o estado do contrato, mas não o modificam. Indica que a função é "somente leitura" e ajuda a otimizar o custo das chamadas. Essas funções podem operar com os parâmetros fornecidos e realizar cálculos internos.
*/