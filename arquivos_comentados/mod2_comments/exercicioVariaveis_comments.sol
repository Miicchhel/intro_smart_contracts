// SPDX-License-Identifier: MIT
// Licença do contrato, neste caso, MIT (open source)

pragma solidity ^0.8.4;
// Versão do compilador Solidity a ser usada (0.8.4 ou superior)

contract ExercicioVariaveis {
    // Declaração do contrato chamado "ExercicioVariaveis"

    // Variáveis de estado (armazenadas permanentemente no blockchain)
    uint256 idade = 18;  // Idade mínima, inicializada com 18
    bool sucess;  // Variável para indicar sucesso de operações

    string nome;  // Nome do usuário
    address endereco;  // Endereço Ethereum do usuário
    uint256 private senha;  // Senha do usuário (privada, só acessível dentro do contrato)

    // Função interna para verificar a idade
    // 'internal': só pode ser chamada dentro deste contrato ou contratos que herdam dele
    // 'view': não modifica o estado do contrato
    function confereIdade(uint256 _idade) internal view {
        // Verifica se a idade fornecida é maior ou igual à idade mínima
        require(_idade >= idade, "nao eh permitida a entrada de menores de idade");
        // Se a condição não for atendida, a transação é revertida com a mensagem de erro
    }

    // Função externa pura que realiza uma operação matemática
    // 'external': pode ser chamada de fora do contrato
    // 'pure': não lê nem modifica o estado do contrato
    function atribuir(uint _numero) external pure returns (uint) {
        uint result = _numero += 3;  // Adiciona 3 ao número fornecido
        return result;  // Retorna o resultado
    }

    // Função para entrar na plataforma
    // 'external': pode ser chamada de fora do contrato
    // Modifica o estado, então não é marcada como 'view' ou 'pure'
    function entrarPlataform(string memory _nome, uint256 _idade) external returns (bool) {
        sucess = false;  // Inicializa o sucesso como falso
        confereIdade(_idade);  // Chama a função interna para verificar a idade
        nome = _nome;  // Armazena o nome fornecido
        sucess = true;  // Define o sucesso como verdadeiro se chegou até aqui
        return sucess;  // Retorna o status de sucesso
    }

    // Função para gerar uma senha aleatória
    // 'external': pode ser chamada de fora do contrato
    function gerarSenha() external returns (uint256) {
        // Gera um número aleatório usando informações do bloco e do remetente
        uint256 randomness = uint256(keccak256(abi.encodePacked(msg.sender, block.prevrandao, block.timestamp)));
        senha = randomness;  // Armazena a senha gerada
        return randomness;  // Retorna a senha gerada
    }

    // Função para verificar a senha
    // 'external': pode ser chamada de fora do contrato
    // 'view': não modifica o estado do contrato
    function entrarComSenha(uint256 _senha) external view returns (string memory) {
        // Verifica se a senha fornecida corresponde à senha armazenada
        require(senha == _senha, "sua senha estah incorreta");
        return ("sucesso no login");  // Retorna mensagem de sucesso se a senha estiver correta
    }

    // Função getter para obter o nome
    // 'external': pode ser chamada de fora do contrato
    // 'view': não modifica o estado do contrato
    function getNome() external view returns (string memory) {
        return nome;  // Retorna o nome armazenado
    }

    // Função getter para obter o status de sucesso
    // 'external': pode ser chamada de fora do contrato
    // 'view': não modifica o estado do contrato
    function getSucess() external view returns (bool) {
        return sucess;  // Retorna o status de sucesso
    }
}

/*
Explicações adicionais sobre a estrutura e otimizações de gás:

1. Estrutura do contrato:
   - O contrato define variáveis de estado no início.
   - Em seguida, declara várias funções que interagem com essas variáveis.
   - As funções são marcadas como `external`, `internal`, `view`, ou `pure` dependendo de seu propósito e comportamento.

2. Otimizações de gás:
   - O uso de `external` em vez de `public` para funções chamadas externamente economiza gás.
   - A função `confereIdade` é marcada como `internal`, economizando gás quando chamada internamente.
   - O uso de `view` e `pure` permite que certas funções sejam executadas sem custo de gás quando chamadas externamente sem uma transação.

3. Segurança:
   - A variável `senha` é marcada como `private` para evitar acesso direto de fora do contrato.
   - A função `confereIdade` usa `require` para garantir que apenas usuários com idade adequada possam entrar na plataforma.

4. Geração de números aleatórios:
   - A função `gerarSenha` tenta criar um número pseudo-aleatório, mas é importante notar que este método não é verdadeiramente aleatório e pode ser manipulado por mineradores. Para aplicações que requerem verdadeira aleatoriedade, seria necessário usar um oráculo externo.

Este contrato serve como um exemplo educacional de como diferentes tipos de variáveis e funções podem ser usados em Solidity, bem como algumas práticas básicas de segurança e otimização de gás.
*/