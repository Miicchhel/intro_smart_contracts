// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract ExercicioVariaveis {
    uint256 idade = 18;
    bool sucess;

    string nome;
    address endereco;
    uint256 private senha;

    function confereIdade(uint256 _idade) internal view {
        require(_idade >= idade, "nao eh permitida a entrada de menores de idade");
    }

    function atribuir(uint _numero) external pure returns (uint) {
        uint result = _numero += 3;
        return result;
    }

    function entrarPlataform(string memory _nome, uint256 _idade) external  returns (bool) {
        sucess = false;
        confereIdade(_idade);
        nome = _nome;
        sucess = true;
        return sucess;
    }

    function gerarSenha() external returns (uint256) {
        uint256 randomness = uint256(keccak256(abi.encodePacked(msg.sender,/*block.difficulty*/ block.prevrandao, block.timestamp)));
        senha = randomness;
        return randomness;
    }

    function entrarComSenha(uint256 _senha) external view returns (string memory) {
        require(senha == _senha, "sua senha estah incorreta");
        return ("sucesso no login");
    }

    function getNome() external view returns (string memory) {
    return nome;
    }

    function getSucess() external view returns (bool) {
        return sucess;
    }
}