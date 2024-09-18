// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract Arrays {
    // Array de tamanho fixo, que pode armazenar até 4 elementos do tipo string.
    // Os índices vão de 0 a 3.
    string[4] public Alunos; // Exemplo de array fixo

    // Array dinâmico que pode armazenar qualquer número de elementos do tipo string.
    // O tamanho pode crescer conforme a adição de novos elementos.
    string[] public DisciplinaNome;

    // Array de arrays de strings, permitindo armazenar matrizes de disciplinas e professores.
    string[][] private MatrizesDiscProf;

    // Função para adicionar uma nova disciplina ao array dinâmico.
    function definirDisciplina(string memory _nome) external {
        // Adiciona o nome da disciplina ao final do array DisciplinaNome.
        DisciplinaNome.push(_nome);
    }

    // Função para remover uma disciplina do array dinâmico.
    function deletarDisciplina(uint256 _numero) external {
        // A função delete aqui define o valor da posição _numero como uma string vazia.
        // O array manterá seu tamanho, mas o valor na posição _numero será uma string vazia.
        delete DisciplinaNome[_numero];
    }

    // Função para obter o tamanho do array dinâmico.
    function getTotalDisciplinas() external view returns (uint256) {
        return DisciplinaNome.length;
    }
}
