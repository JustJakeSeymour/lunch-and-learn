class CountriesFacade
  def self.one_country
    json = CountriesService.all_countries
  end
end