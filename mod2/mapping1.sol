// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract NovaTurmaMapping {
    mapping (string => string) public dicionario;
    mapping (string => uint256) public numeroPresenca;
    mapping (address => bool) public presenca;
    mapping (address => mapping (address => uint256)) public notaProfessorAluno;

    function setPalavraDicionario(string memory _palavra, string memory _significado) external {
        dicionario[_palavra] = _significado;
    }

    function setNumeroPresenca(uint256 _numeroChegada, string memory _nomeAluno) external {
        numeroPresenca[_nomeAluno] = _numeroChegada;
    }

    function setPresenca() external {
        presenca[msg.sender] = true;
    }

    function setNotaAluno(address _aluno, uint256 _nota) external {
        notaProfessorAluno[msg.sender][_aluno] = _nota;
    }
}