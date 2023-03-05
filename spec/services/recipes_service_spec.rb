require 'rails_helper'

RSpec.describe RecipesService, type: :service do
  context 'class methods' do
    it 'returns a list of recipes pertaining to a country', :vcr do
      country = 'thailand'
      service = RecipesService.country_recipes(country)

      expect(service).to be_a(Hash)
      expect(service).to have_key(:activity)
      expect(service[:activity]).to be_a(String)
    end
  end
end
