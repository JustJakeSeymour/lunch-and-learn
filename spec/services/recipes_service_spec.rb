require 'rails_helper'

RSpec.describe RecipesService, type: :service do
  context 'class methods' do
    it 'returns a list of recipes pertaining to a country', :vcr do
      country = 'thailand'
      service = RecipesService.country_recipes(country)
      service_recipes = service[:hits].first[:recipe]

      expect(service).to have_key(:hits)
      expect(service[:hits]).to be_an(Array)
      expect(service[:hits].first).to be_a(Hash)
      expect(service[:hits].first).to have_key(:recipe)
      
      expect(service_recipes).to have_key(:label)
      expect(service_recipes[:label]).to be_a(String)
      expect(service_recipes).to have_key(:url)
      expect(service_recipes[:url]).to be_a(String)
      expect(service_recipes).to have_key(:image)
      expect(service_recipes[:image]).to be_a(String)
    end
  end
end
