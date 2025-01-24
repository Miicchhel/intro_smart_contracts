// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract ExemploVariaveis {
    uint8 public maxPermit = 255;
    uint8 public testLimit;
    int256 public negativo = -1;
    uint256 public numero;
    int256 public numeroNegativo;

    bool public permissao;
    address public contaRegistrada;
    string public nome;
    bytes public Meusbytes;

    function mudarPermissao(bool _trueouFalse) external {
        permissao = _trueouFalse;
    }

    function RegistrarEndereco(address _endereco) external {
        contaRegistrada = _endereco;
    }

    function registrarMeuEndereco(string memory _meuNome) external  {
        contaRegistrada = msg.sender;
        nome = _meuNome;
    }

    function armazenarDados(bytes memory _dados) public {
        Meusbytes = _dados;
    }

    function convertStringBytes(string memory _minhaFrase) external pure returns (bytes32) {
        bytes32 minhaFrase = bytes32(bytes(_minhaFrase));
        return minhaFrase;
    }

    function convertBytesStringClean(bytes32 _minhaFrase) external pure returns (string memory) {
        bytes memory byteArray = new bytes(32);
        uint256 length = 0;

        for (uint256 i = 0; i < 32; i++) {
            if (_minhaFrase[i] != bytes1(0)) {
                byteArray[length] = _minhaFrase[i];
                length++;
            } else {
                break;
            }
        }

        bytes memory trimmedArray = new bytes(length);
        for (uint256 j = 0; j < length; j++) {
            trimmedArray[j] = byteArray[j];
        }

        return string(trimmedArray);
    }

    function obterTamanhoDados() public view returns (uint256) {
        return Meusbytes.length;
    }

    function inserirMaxuint(uint8 _numero) external  {
        testLimit = _numero;
    }

    function inserirNumero(uint256 _numero) external  {
        numero = _numero;
    }

    function testeNegativo(int256 _numero) external view  returns(int256) {
        int256 numNegativo = _numero;
        int256 somaDosNegativos = negativo - numNegativo;
        return somaDosNegativos;
    }
}