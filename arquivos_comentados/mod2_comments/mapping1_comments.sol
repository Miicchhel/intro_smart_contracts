// SPDX-License-Identifier: MIT
// Esta linha especifica a licença do código. MIT é uma licença de software livre permissiva.

// Define a versão do compilador Solidity a ser usada.
// O '^' significa "esta versão ou qualquer versão mais recente compatível".
pragma solidity ^0.8.4;

// Declaração do contrato chamado "NovaTurmaMapping"
contract NovaTurmaMapping {
    // Mapping para armazenar um dicionário de palavras e seus significados
    // 'public' torna o mapping acessível externamente e cria um getter automático
    mapping (string => string) public dicionario;

    // Mapping para registrar o número de chegada de cada aluno
    // A chave é o nome do aluno (string) e o valor é o número de chegada (uint256)
    mapping (string => uint256) public numeroPresenca;

    // Mapping para registrar a presença de cada endereço (aluno ou professor)
    // A chave é o endereço e o valor é um booleano (true se presente, false se ausente)
    mapping (address => bool) public presenca;

    // Mapping aninhado para armazenar notas dadas por professores aos alunos
    // O primeiro address é o do professor, o segundo é o do aluno, e o uint256 é a nota
    mapping (address => mapping (address => uint256)) public notaProfessorAluno;

    // Função para adicionar uma palavra e seu significado ao dicionário
    // 'external' significa que a função só pode ser chamada de fora do contrato
    // 'memory' indica que os parâmetros são armazenados temporariamente na memória
    function setPalavraDicionario(string memory _palavra, string memory _significado) external {
        dicionario[_palavra] = _significado;
    }

    // Função para registrar o número de chegada de um aluno
    function setNumeroPresenca(uint256 _numeroChegada, string memory _nomeAluno) external {
        numeroPresenca[_nomeAluno] = _numeroChegada;
    }

    // Função para marcar presença do remetente da transação
    // 'msg.sender' é uma variável global que contém o endereço de quem chamou a função
    function setPresenca() external {
        presenca[msg.sender] = true;
    }

    // Função para um professor atribuir uma nota a um aluno
    // O professor é identificado por msg.sender e o aluno pelo parâmetro _aluno
    function setNotaAluno(address _aluno, uint256 _nota) external {
        notaProfessorAluno[msg.sender][_aluno] = _nota;
    }
}

/*
Explicações adicionais:

1. Estrutura do código:
   - O contrato é organizado com as declarações de state variables (mappings) no topo, seguidas pelas funções que manipulam esses dados.
   - Cada mapping e função tem um propósito específico relacionado à gestão de uma turma.

2. Uso de mappings:
   - Mappings são estruturas de dados eficientes em Solidity para armazenar pares chave-valor.
   - São usados aqui para criar relações entre diferentes tipos de dados (strings, endereços, uint256, bool).

3. Visibilidade e modificadores de funções:
   - Todas as funções são marcadas como 'external', o que é uma boa prática para otimização de gás quando as funções não precisam ser chamadas internamente.
   - Os mappings são 'public', o que cria getters automáticos e permite leitura direta dos dados.

4. Otimizações de gás:
   - O uso de 'external' nas funções economiza gás comparado a 'public'.
   - Mappings são geralmente mais eficientes em termos de gás do que arrays para armazenamento e acesso a dados.

5. Segurança:
   - Não há controles de acesso implementados, o que significa que qualquer pessoa pode chamar qualquer função. Em um cenário real, você provavelmente adicionaria modificadores para restringir o acesso a certas funções (por exemplo, apenas professores podem atribuir notas).

6. Possíveis melhorias:
   - Adicionar eventos para registrar mudanças importantes (por exemplo, quando uma nota é atribuída).
   - Implementar controle de acesso para funções sensíveis.
   - Adicionar validações de entrada para garantir que os dados inseridos sejam válidos.

Este contrato fornece funcionalidades básicas para gerenciar uma turma, incluindo um dicionário, registro de presenças e atribuição de notas. É um bom exemplo para entender os conceitos básicos de Solidity, mas para uso em produção, precisaria de mais recursos de segurança e funcionalidades adicionais.
*/