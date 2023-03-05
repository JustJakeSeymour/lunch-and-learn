class CountriesFacade
  def self.random_country
    json = CountriesService.all_countries
    countries_array(json).sample(1).first
  end

  def self.countries_array(json)
    json.map do |data|
      Country.new(data)
    end
  end
end