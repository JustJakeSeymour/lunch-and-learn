class RecipesService
  def self.country_recipes(country)
    response = conn.get("?q=#{country}")
    parse_json(response)
  end

  def self.conn
    Faraday.new(url: 'https://api.edamam.com/api/recipes/v2') do |f|
      f.params['app_id'] = ENV['edamam_application_id']
      f.params['app_key'] = ENV['edamam_application_key']
      f.params['type'] = 'public'
    end
  end

  def self.parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end