// SPDX-License-Identifier: MIT
// Define a licença do contrato para especificar os direitos do autor. Aqui, "MIT" é uma das licenças mais permissivas.
pragma solidity ^0.8.9;
// Define a versão do Solidity necessária para compilar o contrato. Isso ajuda a evitar incompatibilidades de versão.

contract Exemplovariavel {
    // Exemplo 1: Declaração de variáveis
    
    // Variável pública de 8 bits sem sinal (0 a 255)
    uint8 public maxPermite = 255;
    // Variável pública de 8 bits sem sinal para teste de limites
    uint8 public testLimit;
    // Variável pública de 256 bits com sinal (permite números negativos)
    int256 public negativo = -1;
    // Variável pública de 256 bits sem sinal (apenas números positivos)
    uint256 public numero;

    int256 public numeroNegativo;

    // Exemplo 2: Outras variáveis de tipos diferentes
    
    // Variável pública booleana para armazenar verdadeiro/falso
    bool public permissao;
    // Armazena um endereço (conta Ethereum)
    address public contaRegistrada;
    // Armazena uma string (texto)
    string public nome;
    // Armazena dados em formato bytes
    bytes public Meusbytes;

    // Funções Exemplo 1:

    // Função para inserir um número (uint8) e armazená-lo em 'testLimit'
    function inserirMaxuint(uint8 _numero) external {
        testLimit = _numero; 
    }

    // Função para inserir um número (uint256) e armazená-lo em 'numero'
    function inserirNumero(uint256 _numero) external {
        numero = _numero;
    }

    // Função para testar números negativos e retornar o resultado da subtração
    function testNegativo(int256 _numero) external view returns (int256) {
        // Variável interna 'NumNegativo' para armazenar o parâmetro recebido
        int256 NumNegativo = _numero;

        // Soma os negativos, usando a variável pública 'negativo' (-1) e a interna
        int256 somaDosNegativos = negativo - NumNegativo;
        
        // Retorna o resultado da subtração
        return somaDosNegativos;
    }

    // Funções Exemplo 2:

    // Função para alterar a variável 'permissao' para verdadeiro/falso
    function mudarPermissao(bool _trueFalse) external {
        permissao = _trueFalse;
    }

    // Função para registrar um endereço (conta Ethereum) na variável 'contaRegistrada'
    function registrarEndereco(address _endereco) external {
        contaRegistrada = _endereco;
    }

    // Função para registrar o endereço de quem chamou a função (msg.sender) e um nome associado
    function registrarMeuEndereco(string memory _meunome) external {
        // 'msg.sender' é uma variável global em Solidity que representa o endereço da conta que está interagindo com a função do contrato
        contaRegistrada = msg.sender;
        nome = _meunome;
    }

    // Função para armazenar dados em formato bytes na variável 'Meusbytes'
    function armazenarDados(bytes memory _dados) public {
        Meusbytes = _dados;
    }

    // Função para converter uma string em bytes32 e retornar o resultado
    function convertStringBytes(string memory _minhaFrase) external pure returns (bytes32) {
        // Converte a string recebida para bytes32
        bytes32 minhaFrase = bytes32(bytes(_minhaFrase)); 
        return minhaFrase;
    }

    // Função para obter o tamanho dos dados armazenados na variável 'Meusbytes'
    function obterTamanhoDados() public view returns (uint256) {
        return Meusbytes.length;
    }
}

/* 
"external", "view", e "pure" são palavras-chave usadas para definir características específicas das funções. Lembre-se:

- **"external"**: Indica que a função só pode ser chamada de fora do contrato. Internamente, você deve usar `this.functionName()` para chamá-la. Esse modificador ajuda a controlar a visibilidade das funções e a otimizar o contrato.

- **"view"**: Aplica-se a funções que apenas leem os dados do contrato, sem modificar seu estado. Usar esse modificador informa ao compilador e aos usuários que a função é somente para leitura, ajudando na eficiência do contrato.

- **"pure"**: É mais restritivo, pois a função marcada como "pure" não pode acessar nem alterar o estado do contrato. Ela só pode operar com os parâmetros fornecidos e realizar cálculos internos. Ao contrário de "external", uma função "pure" pode ser chamada diretamente dentro do contrato, sem a necessidade de usar `this.functionName()`.
*/
