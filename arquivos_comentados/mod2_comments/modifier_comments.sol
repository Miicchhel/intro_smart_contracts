// SPDX-License-Identifier: MIT
// Especifica a licença do código-fonte, neste caso, MIT

// Define a versão do compilador Solidity a ser usada
// Deve ser maior ou igual a 0.8.1 e menor que 0.9.0
pragma solidity >=0.8.1 <0.9.0;

// Declaração do contrato chamado "testModifier"
contract testModifier {
    // Variável de estado pública para armazenar o endereço do proprietário do contrato
    address public owner;
    
    // Variável de estado pública para armazenar um valor inteiro, inicializada com 10
    uint256 public x = 10;
    
    // Variável de estado pública booleana para controle de reentrada
    bool public locked;

    // Construtor do contrato, executado apenas uma vez durante a implantação
    constructor() {
        // Define o endereço que implanta o contrato como o proprietário
        owner = msg.sender;
    }

    // Modificador que restringe o acesso a uma função apenas ao proprietário do contrato
    modifier onlyOwner() {
        // Verifica se o chamador da função (msg.sender) é o proprietário
        require(msg.sender == owner, "Not owner.");
        // O símbolo '_' representa onde o código da função modificada será inserido
        _;
    }

    // Modificador que verifica se um endereço fornecido é válido (não é o endereço zero)
    modifier validAddress(address _addr) {
        // Verifica se o endereço fornecido não é o endereço zero
        require(_addr != address(0), "Not valid address");
        _;
    }

    // Função para mudar o proprietário do contrato
    // Usa os modificadores onlyOwner e validAddress
    function changedOwner(address _newOwner) public onlyOwner validAddress(_newOwner) {
        // Atualiza o proprietário para o novo endereço fornecido
        owner = _newOwner;
    }

    // Modificador para prevenir ataques de reentrada
    modifier noReentracy() {
        // Verifica se o contrato não está bloqueado
        require(!locked, "No reentrancy");
        // Bloqueia o contrato
        locked = true;
        // Executa o código da função
        _;
        // Desbloqueia o contrato após a execução
        locked = false;
    }

    // Função para decrementar a variável x
    // Usa o modificador noReentracy para prevenir ataques de reentrada
    function decrement(uint256 i) public noReentracy {
        // Decrementa x em 1
        x -= 1;

        // Se i for maior que 1, chama a função recursivamente
        if (i > 1) {
            decrement(i - 1);
        }
    }
}

/*
Explicações adicionais:

1. Estrutura do código:
   - O código segue a estrutura padrão de um contrato Solidity, com a declaração da licença, versão do pragma, e definição do contrato.
   - Dentro do contrato, temos variáveis de estado, um construtor, modificadores e funções.

2. Lógica envolvida:
   - O contrato implementa um sistema de propriedade, onde apenas o proprietário pode executar certas ações.
   - Há uma função para mudar o proprietário, com verificações de segurança.
   - A função `decrement` demonstra como prevenir ataques de reentrada usando um modificador.

3. Otimizações de gás:
   - O uso de modificadores ajuda a reduzir a duplicação de código e, consequentemente, o custo de gás.
   - A variável `locked` é usada para prevenir reentrada, o que é uma prática eficiente em termos de gás comparada a outras técnicas.

4. Segurança:
   - O contrato implementa várias medidas de segurança, como verificação de propriedade, validação de endereços e prevenção de reentrada.

5. Boas práticas:
   - O código usa nomes descritivos para variáveis e funções.
   - Os modificadores são usados para encapsular lógica de verificação comum.

Este contrato serve como um bom exemplo para demonstrar o uso de modificadores, controle de acesso e prevenção de reentrada em Solidity. É adequado para programadores de todos os níveis, pois aborda conceitos básicos e avançados de desenvolvimento de contratos inteligentes.
*/
