// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract Atribuicao {
    uint256 idade = 18;
    bool sucess;

    string nome; 
    address endereco; 
    uint256 private senha;

    // 'internal' significa que essa função só pode ser chamada dentro do contrato ou por contratos derivados.
    function confereIdade(uint256 _idade) internal view {
        // 'require' é uma instrução para validar condições. Se a condição falhar, a execução é interrompida e reverte.
        // Se a idade for menor que a mínima (18), a função falha com uma mensagem de erro.
        require(_idade >= idade, "nao eh permitido");
    }

    // 'external' significa que só pode ser chamada fora do contrato. 
    // 'pure' indica que essa função não lê ou modifica variáveis de estado.
    function atribuir(uint256 _numero) external pure returns(uint) {
        uint uintRetorna = _numero += 3; 
        return uintRetorna; 
    }

    function entrarPlataforma(string memory _nome, uint256 _idade) external returns (bool) {
        confereIdade(_idade); // Verifica se o usuário tem idade suficiente.
        nome = _nome; 
        sucess = true;
        return sucess;
    }

    // 'keccak256' é uma função de hashing criptográfica que gera um número pseudoaleatório.
    function gerarSenha() external returns (uint256) {
        // Usa dados dinâmicos como 'msg.sender' (endereço do chamador) e 'block.timestamp' (timestamp do bloco)
        // para criar um hash único. O 'block.prevrandao' adiciona mais aleatoriedade.
        uint256 randomness = uint256(keccak256(abi.encodePacked(msg.sender, block.prevrandao , block.timestamp)));
        senha = randomness;
        return senha;
    }

    // 'view' indica que a função apenas lê dados sem modificá-los.
    function entrarComSenha(uint256 _senha) external view returns (string memory) {
        // Verifica se a senha fornecida é igual à senha armazenada.
        require(senha == _senha, "sua senha esta incorreta"); 
        return ("sucesso no login"); // Retorna uma mensagem de sucesso se a senha for correta.
    }
}


/* 
Lembre-se: O require em Solidity não retorna um valor booleano que você possa usar diretamente em um if/else. Ele é uma instrução que verifica uma condição e, se a condição for falsa, ele interrompe a execução do contrato e reverte todas as mudanças, incluindo o consumo de gás até o ponto da falha.
 */