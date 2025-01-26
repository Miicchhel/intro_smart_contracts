// SPDX-License-Identifier: GPL-3.0
// Especifica a licença do código-fonte, neste caso, GPL-3.0

pragma solidity ^0.8.4;
// Define a versão do compilador Solidity a ser usada (0.8.4 ou superior)

contract ExemplosArrays {
    // Declaração do contrato chamado "ExemplosArrays"

    // Array fixo de 4 elementos do tipo string para armazenar nomes de alunos
    // 'public' permite acesso externo e cria automaticamente um getter
    string[4] public Alunos;

    // Array dinâmico de strings para armazenar nomes de disciplinas
    // 'public' permite acesso externo e cria automaticamente um getter
    string[] public DisciplinaNome;

    // Matriz (array bidimensional) privada para armazenar disciplinas e professores
    // 'private' restringe o acesso apenas ao próprio contrato
    string[][] private MatrizesDiscProf;

    // Função para adicionar uma nova disciplina ao array DisciplinaNome
    // 'external' permite chamadas apenas de fora do contrato, economizando gás
    function definirDisciplina(string memory NomeD) external {
        DisciplinaNome.push(NomeD);
    }

    // Função para deletar uma disciplina do array DisciplinaNome pelo índice
    // 'delete' não remove o elemento, mas redefine seu valor para o padrão (string vazia)
    function deletarDisciplina(uint256 numeroD) external {
        delete DisciplinaNome[numeroD];
    }

    // Função para visualizar todas as disciplinas
    // 'view' indica que a função não modifica o estado do contrato
    // 'returns' especifica o tipo de retorno (array de strings)
    function verDisciplinas() external view returns (string[] memory) {
        return DisciplinaNome;
    }

    // Função para definir um aluno em uma posição específica do array Alunos
    // 'uint8' é usado para economizar gás, já que o array tem tamanho fixo de 4
    function definirAluno(uint8 num, string memory _aluno) external  {
        Alunos[num] = _aluno;
    }

    // Função para adicionar uma nova disciplina e professor à matriz MatrizesDiscProf
    function definirProfDisciplina(string memory disciplina, string memory professor) external {
        MatrizesDiscProf.push([disciplina, professor]);
    }

    // Função para retornar um professor ou disciplina específica da matriz MatrizesDiscProf
    // 'view' indica que a função não modifica o estado do contrato
    function retornarProfIndiceDisciplina(uint256 indiceDisciplina, uint256 indiceProfessor) external view returns (string memory) {
        return MatrizesDiscProf[indiceDisciplina][indiceProfessor];
    }

    // Função para visualizar as disciplinas em um formato específico
    // 'view' indica que a função não modifica o estado do contrato
    function verDisciplinasFormatado() external view returns (string memory) {
        uint256 count = 0;
        string memory result = "temos ";
        bytes memory disciplinasConcatenadas;
        
        // Loop para contar e concatenar disciplinas não vazias
        for (uint256 i = 0; i < DisciplinaNome.length; i++) {
            if (bytes(DisciplinaNome[i]).length > 0) {
                count++;
                if (disciplinasConcatenadas.length > 0) {
                    // Adiciona vírgula e espaço se não for a primeira disciplina
                    disciplinasConcatenadas = abi.encodePacked(disciplinasConcatenadas, ", ", DisciplinaNome[i]);
                } else {
                    // Primeira disciplina não vazia
                    disciplinasConcatenadas = abi.encodePacked(DisciplinaNome[i]);
                }
            }
        }
        
        // Monta a string final com o número de disciplinas e a lista formatada
        result = string(abi.encodePacked(result, uint2str(count), " disciplinas cadastradas: ", disciplinasConcatenadas, "."));
        return result;
    }

    // Função interna para converter uint256 para string
    // 'internal' permite o uso apenas dentro do contrato e contratos derivados
    // 'pure' indica que a função não lê nem modifica o estado do contrato
    function uint2str(uint256 _i) internal pure returns (string memory str) {
        if (_i == 0) {
            return "0";
        }
        uint256 j = _i;
        uint256 length;
        // Calcula o número de dígitos
        while (j != 0) {
            length++;
            j /= 10;
        }
        // Cria um array de bytes com o tamanho correto
        bytes memory bstr = new bytes(length);
        // Preenche o array de bytes com os dígitos do número
        while (_i != 0) {
            bstr[--length] = bytes1(uint8(48 + _i % 10));
            _i /= 10;
        }
        // Converte o array de bytes para string
        str = string(bstr);
    }
}
/*
Explicações adicionais sobre a estrutura e otimizações de gás:

1. Estrutura do contrato:
   - O contrato usa diferentes tipos de arrays para demonstrar várias funcionalidades.
   - Combina arrays fixos, dinâmicos e bidimensionais para armazenar diferentes tipos de dados.

2. Otimizações de gás:
   - Uso de `external` em vez de `public` para funções que só são chamadas externamente, economizando gás.
   - Uso de `uint8` para o índice do array fixo `Alunos`, economizando gás ao limitar o tamanho do tipo de dados.
   - Uso de `view` e `pure` para funções que não modificam o estado, permitindo chamadas mais eficientes em termos de gás.

3. Segurança:
   - Uso de `private` para a matriz `MatrizesDiscProf` para proteger dados sensíveis.
   - Não há verificações de limites explícitas, o que pode levar a erros se os índices fornecidos estiverem fora dos limites dos arrays.

4. Funcionalidades:
   - O contrato permite gerenciar alunos, disciplinas e associações entre disciplinas e professores.
   - Inclui funções para adicionar, deletar e visualizar dados de diferentes maneiras.

5. Manipulação de strings:
   - Usa `abi.encodePacked()` para concatenação eficiente de strings.
   - Implementa uma função personalizada `uint2str()` para converter números em strings, já que Solidity não possui esta funcionalidade nativamente.

Este contrato serve como um bom exemplo para demonstrar várias técnicas de manipulação de arrays e strings em Solidity, bem como práticas de otimização de gás e estruturação de contratos.

*/