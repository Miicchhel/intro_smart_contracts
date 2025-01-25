// SPDX-License-Identifier: MIT
// Esta linha especifica a licença do código. MIT é uma licença de software livre comumente usada.

pragma solidity ^0.8.4;
// Esta linha especifica a versão do compilador Solidity a ser usada.
// O símbolo ^ significa "esta versão ou superior, mas não a próxima versão principal".

// Definição do contrato chamado "Operadores"
contract Operadores {
    // Declaração de uma variável de estado do tipo uint256 (inteiro sem sinal de 256 bits)
    uint256 valor;

    // Função para calcular a média de dois números
    // 'public': pode ser chamada externamente e internamente
    // 'pure': não lê nem modifica o estado do contrato
    // Retorna um uint256
    function calcularMedia(uint _a, uint _b) public pure returns (uint256) {
        // Calcula a média e armazena em 'result'
        uint256 result = (_a + _b) / 2;
        // Retorna o resultado
        return result;
    }

    // Função para multiplicar dois números
    function calcularMultiplicacao(uint256 _a, uint256 _b) public pure returns (uint256) {
        // Multiplica os dois números e armazena em 'result'
        uint256 result = _a * _b;
        // Retorna o resultado
        return result;
    }

    // Função para verificar a conjunção lógica (AND) de dois booleanos
    function verificaConjuncao(bool _a, bool _b) public pure returns (bool) {
        // Realiza a operação AND e armazena em 'result'
        bool result = _a && _b;
        // Retorna o resultado
        return result;
    }

    // Função para verificar a disjunção lógica (OR) de dois booleanos
    function verificaDisjuncao(bool _a, bool _b) public pure returns (bool) {
        // Realiza a operação OR e armazena em 'result'
        bool result = _a || _b;
        // Retorna o resultado
        return result;
    }

    // Função para verificar se um número é maior que outro
    function verificarMaior(uint256 _a, uint256 _b) public pure returns (bool) {
        // Compara se _a é maior que _b e armazena o resultado em 'result'
        bool result = _a > _b;
        // Retorna o resultado
        return result;
    }

    // Função para verificar se dois números são iguais
    function verificarIgual(uint256 _a, uint256 _b) public pure returns (bool) {
        // Compara se _a é igual a _b e armazena o resultado em 'result'
        bool result = _a == _b;
        // Retorna o resultado
        return result;
    }

    // Função para verificar se dois números são diferentes
    function verificarDiferente(uint256 _a, uint256 _b) public pure returns (bool) {
        // Compara se _a é diferente de _b e armazena o resultado em 'result'
        bool result = _a != _b;
        // Retorna o resultado
        return result;
    }

    // Função para definir o valor da variável de estado 'valor'
    // 'public': pode ser chamada externamente e internamente
    function setValor(uint256 _valor) public {
        // Estrutura de controle if-else para definir o valor
        if (_valor >= 10) {
            // Se _valor for maior ou igual a 10, atribui _valor diretamente
            valor = _valor;
        } else if (_valor > 0 && _valor <= 5 ){
            // Se _valor estiver entre 1 e 5, subtrai 1 antes de atribuir
            valor = _valor - 1;
        } else {
            // Para todos os outros casos (0 ou negativo), atribui 0
            valor = 0;
        }
    }

    // Função para obter o valor atual da variável de estado 'valor'
    // 'public': pode ser chamada externamente e internamente
    // 'view': não modifica o estado do contrato, apenas lê
    function getValor() public view returns (uint256) {
        // Retorna o valor atual da variável 'valor'
        return valor;
    } 
}

/*
Explicações adicionais:

1. Estrutura do código: O contrato "Operadores" contém várias funções que demonstram diferentes operações e conceitos em Solidity.

2. Otimizações de gás:
   - O uso de `pure` e `view` em funções que não modificam o estado ajuda a economizar gás.
   - A utilização de tipos de dados apropriados (como `uint256`) evita conversões desnecessárias.

3. Lógica do contrato:
   - O contrato demonstra operações aritméticas, lógicas e de comparação.
   - A função `setValor` mostra o uso de estruturas de controle condicional.

4. Visibilidade e modificadores de função:
   - `public`: Todas as funções são públicas, permitindo acesso externo e interno.
   - `pure`: Usado em funções que não leem nem modificam o estado.
   - `view`: Usado na função `getValor` que lê, mas não modifica o estado.

5. Variável de estado:
   - `valor` é uma variável de estado que pode ser modificada pela função `setValor` e lida pela função `getValor`.

Este contrato serve como um bom exemplo para iniciantes aprenderem sobre operadores básicos, estruturas de controle e conceitos de visibilidade em Solidity.
*/