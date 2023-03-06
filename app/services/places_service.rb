class PlacesService
  def self.tourism_radius(latlong, radius)
    response = conn.get("places?categories=tourism&filter=circle:#{latlong[1]},#{latlong[0]},#{radius}")
    parse_json(response)
  end

  def self.conn
    Faraday.new(url: 'https://api.geoapify.com/v2/') do |f|
      f.params['apiKey'] = ENV['places_api_key']
    end
  end

  def self.parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end