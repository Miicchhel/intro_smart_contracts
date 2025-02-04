// SPDX-License-Identifier: MIT
// Esta linha especifica a licença do código, neste caso, MIT

// Define a versão do compilador Solidity a ser usada
// O ^ indica que qualquer versão 0.8.4 ou superior (mas não 0.9.0+) é aceitável
pragma solidity ^0.8.4;

// Importa a biblioteca Strings da OpenZeppelin para manipulação de strings
import "@openzeppelin/contracts/utils/Strings.sol";

// Declaração do contrato chamado 'funcoesExemplo'
contract funcoesExemplo {
    // Variáveis de estado do contrato
    uint256 public numero;  // Armazena um número inteiro, acessível publicamente
    string public nome;     // Armazena um nome como string, acessível publicamente
    string public mensagem; // Armazena uma mensagem como string, acessível publicamente
    
    // Constante usada para escala decimal (10^18)
    // Usar constantes ajuda a economizar gás, pois são compiladas diretamente no bytecode
    uint256 constant SCALE = 1e18;

    uint256 valor; // Variável de estado privada (por padrão) para armazenar um valor
    
    // Função interna: só pode ser chamada dentro do contrato
    // Otimização de gás: usar 'internal' em vez de 'private' pode economizar gás
    function setNumero(uint256 _numero) internal {
        // Multiplica o número pela escala e divide por 2
        // Isso efetivamente multiplica o número por 0.5 * 10^18
        uint256 subNumero = (_numero*SCALE) / 2;
        numero = subNumero;
    }

    // Função pública: pode ser chamada por qualquer conta (EOA ou contrato)
    function setMsg(string memory _msg) public {
        mensagem = _msg;
    }

    // Função externa: só pode ser chamada por contas externas (EOAs -  externally owned accounts) ou outros contratos
    // Otimização de gás: 'external' é mais eficiente em termos de gás para funções chamadas externamente
    function setNomeENumero(string memory _nome, uint256 _numero) external  {
        nome = _nome;
        setNumero(_numero);  // Chama a função interna setNumero
        setMsg("Chamou pelo contrato");  // Chama a função pública setMsg
    }

    // Outra função externa para definir o valor
    function setValor(uint _valor) external  {
        valor = _valor;
    }

    // Função de visualização (view): não modifica o estado, apenas lê
    // Retorna uma string formatada do número armazenado
    function getValor() external view returns (string memory) {
        // Divide o número em parte inteira e decimal
        uint inteiro = numero / SCALE;
        uint decimal = numero % SCALE;
        
        // Formata como "inteiro.decimal" usando a biblioteca Strings
        return string(abi.encodePacked(Strings.toString(inteiro), ".", formatDecimal(decimal)));
    }

    // Função interna pura: não acessa nem modifica o estado do contrato
    // Formata a parte decimal do número
    function formatDecimal(uint256 decimal) internal pure returns (string memory) {
        // Se o decimal for menor que 10, adiciona um zero à esquerda
        if (decimal < 10) {
            return string(abi.encodePacked("0", Strings.toString(decimal)));
        }
        return Strings.toString(decimal);
    }

    // Função externa pura: realiza uma multiplicação simples
    // 'pure' indica que a função não lê nem modifica o estado do contrato
    function multiplicar(uint x, uint y) external pure returns (uint256) {
        uint valorMultiplicacao = x * y;
        return valorMultiplicacao;
    }

    // Função para receber Ether
    // 'payable' permite que a função receba Ether junto com a chamada
    function payEther() external payable  { }
}
/*
Explicações adicionais:

1. **Estrutura do Contrato**: O contrato `funcoesExemplo` contém várias variáveis de estado e funções que demonstram diferentes níveis de visibilidade e comportamentos.

2. **Otimizações de Gás**:
   - Uso de `constant` para `SCALE`: Economiza gás pois é compilado diretamente no bytecode.
   - Uso de funções `external`: Mais eficiente em gás para chamadas externas.
   - Uso de funções `internal` em vez de `private`: Pode economizar gás em certas situações.

3. **Visibilidade de Funções**:
   - `internal`: Só pode ser chamada dentro do contrato.
   - `public`: Pode ser chamada por qualquer conta.
   - `external`: Só pode ser chamada por contas externas ou outros contratos.

4. **Modificadores de Estado**:
   - `view`: Indica que a função não modifica o estado do contrato.
   - `pure`: Indica que a função não lê nem modifica o estado do contrato.

5. **Manipulação de Dados**:
   - Uso de `abi.encodePacked()` para concatenar strings.
   - Conversão de números para strings usando `Strings.toString()`.

6. **Recebimento de Ether**:
   - A função `payEther()` é marcada como `payable`, permitindo que o contrato receba Ether.

Este contrato serve como um bom exemplo para demonstrar vários conceitos fundamentais em Solidity, incluindo tipos de variáveis, visibilidade de funções, manipulação de strings e números, e otimizações básicas de gás.
*/