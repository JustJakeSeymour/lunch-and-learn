class CountriesService
  def self.all_countries
    response = conn.get('')
    parse_json(response)
  end

  def self.conn
    Faraday.new(
      url: 'https://restcountries.com/v3.1/all'
    )
  end

  def self.parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end