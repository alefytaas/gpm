# app/services/brasil_api_service.rb
class BrazilApiService
  include HTTParty
  base_uri 'https://brasilapi.com.br/api'

  def initialize
    @options = {
      headers: { 'Content-Type' => 'application/json', 'Accept' => 'application/json' },
      format: :json
    }
  end

  def states
    self.class.get('/ibge/uf/v1', @options)
  end

  def cities(state)
    self.class.get("/ibge/municipios/v1/#{state}", @options)
  end
end
