// SPDX-License-Identifier: MIT
// Especifica a licença do contrato, neste caso, MIT

// Define a versão do compilador Solidity a ser usada
// O ^ indica que qualquer versão igual ou superior a 0.8.4 é compatível
pragma solidity ^0.8.4;

// Declara o contrato chamado MappingWithArray
contract MappingWithArray {
    // Mapping que associa endereços (address) a saldos (uint256)
    // 'public' torna o mapping acessível externamente e cria um getter automático
    mapping (address => uint256) public balances;

    // Mapping que rastreia se um endereço já foi inserido
    // Usado para evitar duplicatas no array de contas
    mapping (address => bool) public inserido;

    // Array que armazena todos os endereços de contas inseridos
    // 'public' cria um getter automático que retorna o endereço em um índice específico
    address[] public contas;

    // Função para adicionar ou atualizar uma conta
    // 'external' torna a função chamável apenas de fora do contrato, economizando gás
    function setConta(address _conta, uint256 _valor) external {
        // Código comentado: uma forma alternativa de verificar se a conta já foi inserida
        // if (!inserido[_conta]) {
        //     inserido[_conta] = true;
        //     contas.push(_conta);
        // }

        // Verifica se a conta já foi inserida, revertendo a transação se for o caso
        // Isso evita duplicatas e economiza gás ao falhar rapidamente
        require(!inserido[_conta], "Conta ja cadastrada");

        // Atualiza o saldo da conta no mapping balances
        balances[_conta] = _valor;

        // Marca a conta como inserida no mapping inserido
        inserido[_conta] = true;

        // Adiciona o endereço da conta ao array contas
        contas.push(_conta);
    }

    // Função para obter o número total de contas cadastradas
    // 'view' indica que a função não modifica o estado do contrato
    // 'external' permite chamadas apenas de fora do contrato, economizando gás
    function getSize() external view returns (uint256) {
        // Retorna o tamanho do array contas
        return contas.length;
    }

    // Função para obter o saldo da primeira conta cadastrada
    // 'view' indica que a função não modifica o estado do contrato
    function getFirstBalance() external view returns (uint256) {
        // Verifica se há pelo menos uma conta cadastrada
        require(contas.length > 0, "A primeira conta ainda nao foi cadastrada");

        // Retorna o saldo da primeira conta (índice 0) do array contas
        return balances[contas[0]];
    }

    // Função para obter o saldo da última conta cadastrada
    // 'view' indica que a função não modifica o estado do contrato
    function getLastBalance() external view returns (uint256) {
        // Armazena o número total de contas em uma variável local
        // Isso pode economizar gás ao evitar múltiplos acessos ao storage
        uint256 totalContas = contas.length;

        // Verifica se há pelo menos uma conta cadastrada
        require(totalContas > 0, "Nao ha contas cadastradas");

        // Retorna o saldo da última conta do array contas
        // Usa totalContas - 1 porque os arrays em Solidity são baseados em zero
        return balances[contas[totalContas - 1]];
    }
}
/*
Explicação adicional sobre a estrutura e otimizações:

1. Estrutura do contrato:
   - O contrato usa um padrão comum em Solidity, combinando mappings e arrays para gerenciar uma lista de contas com saldos associados.
   - O uso de dois mappings (balances e inserido) junto com um array (contas) permite acesso rápido aos dados e iteração sobre todas as contas.

2. Otimizações de gás:
   - O uso de 'external' em vez de 'public' para funções que só precisam ser chamadas externamente economiza gás.
   - A verificação rápida com 'require' na função setConta evita operações desnecessárias se a conta já existir.
   - O armazenamento do tamanho do array em uma variável local em getLastBalance pode economizar gás em contratos maiores.

3. Segurança:
   - O uso de 'require' ajuda a prevenir estados inválidos e fornece mensagens de erro claras.
   - O mapping 'inserido' evita duplicatas no array 'contas', mantendo a integridade dos dados.

4. Flexibilidade:
   - O contrato permite adicionar novas contas, atualizar saldos e consultar informações de forma eficiente.
   - As funções de consulta (getSize, getFirstBalance, getLastBalance) fornecem maneiras úteis de interagir com os dados armazenados.

Este contrato é um bom exemplo de como combinar diferentes estruturas de dados em Solidity para criar um sistema eficiente de gerenciamento de contas e saldos.
*/