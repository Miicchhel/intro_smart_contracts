// SPDX-License-Identifier: MIT
// Esta linha especifica a licença do código. MIT é uma licença de código aberto comumente usada.

pragma solidity ^0.8.4;
// Esta linha define a versão do compilador Solidity a ser usada.
// O símbolo ^ significa "esta versão ou superior, mas não a próxima versão principal".

// Definição do contrato chamado "Construct"
contract Construct {
    // Declaração de variáveis de estado
    
    // Variável pública do tipo string para armazenar um nome
    // Por ser pública, Solidity automaticamente cria um getter para ela
    string public nome;
    
    // Variável imutável do tipo uint256 para armazenar uma idade
    // 'immutable' significa que pode ser definida apenas no construtor e não pode ser alterada depois
    // Isso economiza gás, pois o valor é incorporado diretamente no bytecode do contrato
    uint256 immutable idade;
    
    // Endereço constante do proprietário do contrato
    // 'constant' significa que o valor é definido em tempo de compilação e não pode ser alterado
    // Isso economiza gás, pois o valor é incorporado diretamente no bytecode do contrato
    address public constant owner = 0x777788889999AaAAbBbbCcccddDdeeeEfFFfCcCc;

    // Construtor do contrato
    // É executado apenas uma vez, quando o contrato é implantado
    constructor(string memory _nome, uint256 _idade) {
        nome = _nome;  // Inicializa a variável 'nome' com o valor passado
        idade = _idade;  // Inicializa a variável 'idade' com o valor passado
    }

    // Função pública para obter o nome
    // 'view' indica que a função não modifica o estado do contrato
    // 'returns (string memory)' especifica o tipo de retorno da função
    function getNome() public view returns (string memory) {
        return nome;  // Retorna o valor da variável 'nome'
    }

    // Função externa para definir um novo nome
    // 'external' significa que a função só pode ser chamada de fora do contrato
    // Isso é mais eficiente em termos de gás do que 'public' para funções que não são chamadas internamente
    function setNome(string memory _nome) external {
        // Verifica se o chamador da função é o proprietário do contrato
        // Se não for, a execução é revertida com a mensagem de erro fornecida
        require(msg.sender == owner, "Somente o dono pode alterar o nome");
        nome = _nome;  // Se o chamador for o proprietário, atualiza o nome
    }
}

/*
Explicações adicionais sobre a estrutura e otimizações de gás:

1. Estrutura do contrato:
   - O contrato começa com declarações de variáveis de estado.
   - Em seguida, temos o construtor, que é executado uma única vez na implantação do contrato.
   - Por fim, temos as funções do contrato que definem sua funcionalidade.

2. Otimizações de gás:
   - O uso de `immutable` para `idade` economiza gás, pois o valor é incorporado diretamente no bytecode do contrato, reduzindo o custo de leitura.
   - O uso de `constant` para `owner` também economiza gás pelo mesmo motivo.
   - A função `setNome` é marcada como `external`, o que é mais eficiente em termos de gás do que `public` para funções que só são chamadas externamente.

3. Visibilidade e modificadores de função:
   - `public`: Acessível interna e externamente.
   - `external`: Acessível apenas externamente, mais eficiente para funções chamadas apenas de fora do contrato.
   - `view`: Indica que a função não modifica o estado do contrato, permitindo chamadas sem custo de gás quando chamada externamente.

4. Segurança:
   - A função `setNome` inclui um `require` para garantir que apenas o proprietário possa alterar o nome, implementando um controle de acesso básico.

Este contrato demonstra conceitos básicos de Solidity, incluindo variáveis de estado, construtor, funções, controle de acesso e otimizações de gás. É um bom exemplo para iniciantes entenderem a estrutura básica de um contrato Solidity e algumas práticas comuns de desenvolvimento.
*/