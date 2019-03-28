#language:pt
@API_Correios
Funcionalidade: CEP
  Como uma aplicação de serviço
  Quero consultar os dados de um endereço a partir de um CEP.

  @cep_valido_default
  Cenário: Validar API Correios
    Dado que eu tenha um CEP padrão
      | cep | 06415-130 |
    Quando realizar uma requisição passando um CEP válido
    Então a API deverá retornar os dados referentes ao CEP informado
    E o serviço retorna uma resposta válida com status code 200


  @cep_valido_dados_especificos
  Cenário: Validar API Correios, exibir endereço e IBGE
    Dado que eu tenha um CEP padrão
      | cep | 06415-130 |
    Quando realizar uma requisição passando um CEP válido
    Então a API deverá retornar os dados de IBGE e endereço
    E o serviço retorna uma resposta válida com status code 200


  @cep_invalido
  Cenário: Validar API Correios quando for inserido um CEP inválido
    Dado que eu tenha um CEP padrão
      | cep | 00000000 |
    Quando realizar uma requisição passando um CEP válido
    Então a API deverá retornar um response informando erro ou falha na aplicação
    E o serviço retorna uma resposta válida com status code 200