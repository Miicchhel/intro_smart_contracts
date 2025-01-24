// SPDX-License-Identifier: MIT
// Especifica a licença do contrato, neste caso, MIT

pragma solidity ^0.8.4;
// Define a versão do compilador Solidity a ser usada (0.8.4 ou superior)

contract ExemploVariaveis {
    // Declaração do contrato chamado "ExemploVariaveis"

    // Variáveis de estado (armazenadas permanentemente no blockchain)
    uint8 public maxPermit = 255;
    // Variável uint8 (0 a 255) pública, inicializada com o valor máximo possível
    // Usar uint8 em vez de uint256 pode economizar gás se for agrupado com outras variáveis menores

    uint8 public testLimit;
    // Outra variável uint8 pública, não inicializada (valor padrão é 0)

    int256 public negativo = -1;
    // Variável int256 pública, pode armazenar números negativos, inicializada com -1

    uint256 public numero;
    // Variável uint256 pública, não inicializada (valor padrão é 0)
    // uint256 é o tipo padrão para números inteiros não negativos em Solidity

    int256 public numeroNegativo;
    // Variável int256 pública, não inicializada (valor padrão é 0)

    bool public permissao;
    // Variável booleana pública, não inicializada (valor padrão é false)

    address public contaRegistrada;
    // Variável do tipo address pública, armazena um endereço Ethereum

    string public nome;
    // Variável string pública, armazena texto

    bytes public Meusbytes;
    // Variável bytes pública, armazena dados binários de tamanho dinâmico

    // Funções do contrato

    function mudarPermissao(bool _trueouFalse) external {
        // Função externa que altera o valor da variável 'permissao'
        // 'external' significa que só pode ser chamada de fora do contrato
        permissao = _trueouFalse;
    }

    function RegistrarEndereco(address _endereco) external {
        // Função externa que registra um endereço na variável 'contaRegistrada'
        contaRegistrada = _endereco;
    }

    function registrarMeuEndereco(string memory _meuNome) external  {
        // Função externa que registra o endereço do chamador e um nome
        // 'memory' indica que '_meuNome' é armazenado temporariamente na memória
        contaRegistrada = msg.sender; // msg.sender é o endereço de quem chamou a função
        nome = _meuNome;
    }

    function armazenarDados(bytes memory _dados) public {
        // Função pública que armazena dados binários na variável 'Meusbytes'
        Meusbytes = _dados;
    }

    function convertStringBytes(string memory _minhaFrase) external pure returns (bytes32) {
        // Função externa e pura (não lê nem modifica o estado) que converte string para bytes32
        // Útil para otimização de gás, pois bytes32 é mais eficiente que string
        bytes32 minhaFrase = bytes32(bytes(_minhaFrase));
        return minhaFrase;
    }

    function convertBytesStringClean(bytes32 _minhaFrase) external pure returns (string memory) {
        // Função externa e pura que converte bytes32 para string, removendo bytes nulos
        bytes memory byteArray = new bytes(32);
        uint256 length = 0;

        // Loop para copiar bytes não nulos
        for (uint256 i = 0; i < 32; i++) {
            if (_minhaFrase[i] != bytes1(0)) {
                byteArray[length] = _minhaFrase[i];
                length++;
            } else {
                break; // Para o loop ao encontrar o primeiro byte nulo
            }
        }

        // Cria um novo array de bytes com o tamanho exato
        bytes memory trimmedArray = new bytes(length);
        for (uint256 j = 0; j < length; j++) {
            trimmedArray[j] = byteArray[j];
        }

        // Converte o array de bytes limpo para string
        return string(trimmedArray);
    }

    function obterTamanhoDados() public view returns (uint256) {
        // Função pública e view (não modifica o estado) que retorna o tamanho de 'Meusbytes'
        return Meusbytes.length;
    }

    function inserirMaxuint(uint8 _numero) external  {
        // Função externa que insere um valor uint8 na variável 'testLimit'
        testLimit = _numero;
    }

    function inserirNumero(uint256 _numero) external  {
        // Função externa que insere um valor uint256 na variável 'numero'
        numero = _numero;
    }

    function testeNegativo(int256 _numero) external view returns(int256) {
        // Função externa e view que realiza operações com números negativos
        int256 numNegativo = _numero;
        int256 somaDosNegativos = negativo - numNegativo;
        return somaDosNegativos;
    }
}
/*
Explicações adicionais sobre otimizações de gás e estrutura do código:

1. Uso de tipos de dados apropriados: O contrato usa `uint8` para `maxPermit` e `testLimit`, economizando gás em comparação com `uint256` para valores pequenos.

2. Visibilidade de funções: O uso de `external` em vez de `public` para funções que só são chamadas externamente pode economizar gás.

3. Uso de `view` e `pure`: Essas palavras-chave indicam que as funções não modificam o estado, permitindo chamadas mais eficientes.

4. Agrupamento de variáveis: Variáveis do mesmo tipo são declaradas juntas, o que pode otimizar o armazenamento.

5. Conversão eficiente entre tipos: A função `convertStringBytes` mostra como converter strings para bytes32, que é mais eficiente em termos de gás.

6. Limpeza de dados: `convertBytesStringClean` demonstra como limpar dados desnecessários ao converter de volta para string.

7. Uso de `memory`: Para parâmetros de função que são arrays ou strings, `memory` é usado para indicar armazenamento temporário.

Este contrato serve como um bom exemplo para demonstrar vários tipos de dados e operações em Solidity, bem como algumas considerações de otimização de gás. É adequado para programadores de todos os níveis, fornecendo uma visão geral das capacidades básicas de um contrato Solidity.
*/