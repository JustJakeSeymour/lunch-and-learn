class TouristSightsFacade
  def self.capital_sites(country)
    json = PlacesService.tourism_radius(CountriesFacade.latlong(country), 20000)
    tourist_sights_array(json[:features])
  end

  def self.tourist_sights_array(json)
    json.map do |data|
      TouristSight.new(data[:properties])
    end
  end
end