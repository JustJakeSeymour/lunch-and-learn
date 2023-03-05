require 'rails_helper'

RSpec.describe Recipe, type: :poro do
  context 'initialize' do
    it 'has attributes' do
      data = {
        recipe: {
          label: 'A Recipe',
          url: 'A Url',
          image: 'An Image'
        }
      }
      recipe = Recipe.new(data)

      expect(recipe).to be_a(Recipe)
      expect(recipe.title).to eq('A Recipe')
      expect(recipe.url).to eq('A Url')
      expect(recipe.image).to eq('An Image')
    end
  end
end
