module REST
  def cep
    Correios::Rest::Cep.new
  end
end