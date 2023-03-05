require 'rails_helper'

RSpec.describe Recipe, type: :poro do
  context 'initialize' do
    it 'has attributes' do
      data = {
        recipe: 'Random Recipe'
      }
      recipe = Recipe.new(data)

      expect(recipe).to be_a(Recipe)
      expect(recipe.recipe).to eq('Random Recipe')
    end
  end
end
