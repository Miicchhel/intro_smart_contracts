// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.4;

contract ExemplosArrays {
    string[4] public Alunos;
    string[] public DisciplinaNome;
    string[][] private MatrizesDiscProf;

    function definirDisciplina(string memory NomeD) external {
        DisciplinaNome.push(NomeD);
    }

    function deletarDisciplina(uint256 numeroD) external {
        delete DisciplinaNome[numeroD];
    }

    function verDisciplinas() external view returns (string[] memory) {
        return DisciplinaNome;
    }

    function definirAluno(uint8 num, string memory _aluno) external  {
        Alunos[num] = _aluno;
    }

    function definirProfDisciplina(string memory disciplina, string memory professor) external {
        MatrizesDiscProf.push([disciplina, professor]);
    }

    function retornarProfIndiceDisciplina(uint256 indiceDisciplina, uint256 indiceProfessor) external view returns (string memory) {
        return MatrizesDiscProf[indiceDisciplina][indiceProfessor];
    }

    function verDisciplinasFormatado() external view returns (string memory) {
        uint256 count = 0;
        string memory result = "temos ";
        bytes memory disciplinasConcatenadas;
        
        for (uint256 i = 0; i < DisciplinaNome.length; i++) {
            if (bytes(DisciplinaNome[i]).length > 0) {
                count++;
                if (disciplinasConcatenadas.length > 0) {
                    disciplinasConcatenadas = abi.encodePacked(disciplinasConcatenadas, ", ", DisciplinaNome[i]);
                } else {
                    disciplinasConcatenadas = abi.encodePacked(DisciplinaNome[i]);
                }
            }
        }
        
        result = string(abi.encodePacked(result, uint2str(count), " disciplinas cadastradas: ", disciplinasConcatenadas, "."));
        return result;
    }

    function uint2str(uint256 _i) internal pure returns (string memory str) {
        if (_i == 0) {
            return "0";
        }
        uint256 j = _i;
        uint256 length;
        while (j != 0) {
            length++;
            j /= 10;
        }
        bytes memory bstr = new bytes(length);
        while (_i != 0) {
            bstr[--length] = bytes1(uint8(48 + _i % 10));
            _i /= 10;
        }
        str = string(bstr);
    }
}