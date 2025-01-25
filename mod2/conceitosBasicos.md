# Solidity - Conceitos Básicos

## 🌐 O que é Solidity?

Solidity é uma linguagem de programação usada para escrever contratos inteligentes na blockchain Ethereum. Com ela, é possível criar aplicações descentralizadas (DApps) que operam de maneira segura e transparente.

---
## 🔑 Contas na Blockchain
Na Ethereum, existem dois tipos de contas:
- **EOA (Externally Owned Account)**: Contas controladas por um usuário com chave privada. Elas podem enviar e receber transações.
- **Contratos Inteligentes**: Contas que contêm código que pode ser executado quando chamadas.

---

## 📚 Criando um Contrato Simples
Vamos criar um contrato simples para armazenar um valor:

```solidity
pragma solidity ^0.8.0;

contract MeuContrato {
    uint256 public valor;

    function setValor(uint256 _valor) public {
        valor = _valor;
    }
}
```

Aqui, temos:
- **`uint256`**: Um tipo de dado para armazenar números inteiros positivos.
- **`public`**: Permite que a variável seja acessível externamente.
- **`function setValor`**: Define um novo valor para a variável.

---

## 🔒 Modificadores de Visibilidade

- **`public`**: A função ou variável pode ser acessada por qualquer pessoa.
- **`private`**: Somente o próprio contrato pode acessar.
- **`internal`**: Pode ser acessada pelo contrato e contratos derivados.
- **`external`**: Somente chamadas externas podem acessar.

```solidity
uint256 private segredo;
function getSegredo() public view returns (uint256) {
    return segredo;
}
```

---

## 💰 Trabalhando com Valores (ETH)
Para permitir que o contrato receba ETH, usamos o modificador `payable`.

```solidity
function depositar() external payable {
    // O contrato pode receber ETH
}
```

---

## 🏢 Inicialização do Contrato
O **constructor** é executado uma única vez na implantação do contrato.

```solidity
address public dono;

constructor() {
    dono = msg.sender;
}
```

---

## 🔍 Manipulação de Dados
- **`view`**: Indica que a função apenas lê dados, sem alterar o estado.
- **`pure`**: Indica que a função não lê nem altera o estado.

```solidity
function obterValor() public view returns (uint256) {
    return valor;
}

function somar(uint256 a, uint256 b) public pure returns (uint256) {
    return a + b;
}
```

---

## 📘 Tipos de Dados Importantes

- **`uint` vs `int`**: 
  - `uint` armazena apenas números positivos.
  - `int` permite números positivos e negativos.
- **`bytes` e `bytes32`**: Para armazenar dados binários.

```solidity
bytes public dadosDinamicos;
bytes32 public dadosFixos;
```

---

## 💡 Dicas Práticas
- Sempre use a versão mais recente do Solidity para evitar vulnerabilidades.
- Evite armazenar dados sensíveis diretamente no contrato.
- Use eventos para registrar ações importantes.

```solidity
event Transfer(address indexed _from, address indexed _to, uint256 _value);
```