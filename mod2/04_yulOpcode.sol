// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.4;

contract OpcodeGas {
    
    // Função que realiza a soma de dois números utilizando Solidity
    // Esta função utiliza o operador '+' nativo do Solidity, que já é otimizado, mas ainda gera um custo maior em comparação com o uso de Assembly.
    function somaEmSolidity(uint256 _a, uint256 _b) external pure returns (uint256){
        uint256 soma = _a + _b; // O operador '+' em Solidity gera o opcode 'ADD' internamente, mas envolve mais instruções de controle de fluxo.
        return soma; // Custo de execução: 940 gas (note o custo maior devido ao overhead de Solidity).
    }

    // Função que realiza a mesma soma, mas utilizando Assembly para reduzir o custo de gás.
    // O Assembly em Solidity permite interagir diretamente com os opcodes da Ethereum Virtual Machine (EVM).
    // Aqui usamos o opcode 'ADD' diretamente, economizando algumas operações adicionais que o compilador de Solidity gera.
    function somaEmOpcode(uint256 _a, uint256 _b) external pure returns (uint256 result){
        
        assembly {
            result := add(_a, _b) // Usamos 'add' diretamente em Assembly, que é o opcode da EVM para adição.
            // Isso economiza gás porque evitamos algumas verificações e cálculos que o compilador Solidity normalmente faz.
        }

        return result; // Custo de execução: 770 gas (mais eficiente que a versão anterior).
    }
}

/*
Pontos importantes: a instrução assembly elimina o overhead do compilador Solidity. Isso contribui para reduzir o custo de gás de uma forma mais eficiente, o que é crucial quando se desenvolvem contratos que precisam ser otimizados para execução em larga escala. Porém isso deve ser usado com cautela, embora haja economia de gás pode ser mais propenso a erros e pode dificultar a manutenção e compreensão do código por outras pessoas.

- OpCodes são as instruções fundamentais que a EVM executa.

O que é Yul?
- Yul é uma linguagem intermediária para a Ethereum e outras máquinas virtuais baseadas em EVM, sendo usada como uma representação comum entre diferentes compiladores e otimizadores.
- Yul foi introduzida como uma maneira de criar contratos mais otimizados e eficientes em termos de uso de gás, permitindo interações diretas com os opcodes da EVM sem a necessidade de escrever código assembly puro, que pode ser mais difícil de ler e propenso a erros.
*/