Dado("que eu tenha um CEP padrão") do |table|
  @cep = (table.rows_hash['cep'])
end

Quando("realizar uma requisição passando um CEP válido") do
  @response_body = cep.get_endereco(@cep)

  @data = {
      'cep' => @response_body['cep'],
      'logradouro' => @response_body['logradouro'],
      'complemento' => @response_body['complemento'],
      'bairro' => @response_body['bairro'],
      'localidade' => @response_body['localidade'],
      'uf' => @response_body['uf'],
      'unidade' => @response_body['unidade'],
      'ibge' => @response_body['ibge'],
      'gia' => @response_body['gia']
  }

end

Então("a API deverá retornar os dados referentes ao CEP informado") do
  expect(@data['cep'].equal?(@cep))
  puts @response_body
end


Então("a API deverá retornar um response informando erro ou falha na aplicação") do
  expect(@data['cep'].nil?)
  puts @response_body
end


Então("a API deverá retornar os dados de IBGE e endereço") do
  expect(@data['cep'].equal?(@cep))
  puts "\n#Endereço: #{@data['logradouro']} \n#Bairro: #{@data['bairro']}\n#Localidade: #{@data['localidade']} \n#UF: #{@data['uf']} \n#IBGE: #{@data['ibge']}"
end

E('o serviço retorna uma resposta válida com status code {int}') do |status_code|
  expect(@response_body.code).to eql status_code
end
