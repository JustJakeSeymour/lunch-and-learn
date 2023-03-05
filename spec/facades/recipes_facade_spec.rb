require 'rails_helper'

RSpec.describe RecipesFacade, type: :facade do
  describe 'class methods' do
    context 'call country search result' do
      it 'country_recipes', :vcr do
        country = 'thailand'
        expect(RecipesFacade.country_recipes(country)).to be_an(Array)
        expect(RecipesFacade.country_recipes(country).first).to be_a(Recipe)
      end
    end
  end
end
