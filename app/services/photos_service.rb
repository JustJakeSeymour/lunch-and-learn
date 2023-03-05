class PhotosService
  def self.country_photos(country)
    response = conn.get("?location[country]=#{country}")
    parse_json(response)
  end

  def self.conn
    Faraday.new(url: 'https://api.unsplash.com/photos/') do |f|
      f.params['client_id'] = ENV['unsplash_access_key']
    end
  end

  def self.parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end