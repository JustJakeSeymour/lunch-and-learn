require 'rails_helper'

RSpec.describe 'favorites API endpoint' do
  describe 'happy path testing' do
    let!(:user) { User.create(name: 'username', email: 'user@email.com', api_key: Faker::Barcode.ean(13)) }

    context 'create favorite' do
      it 'creates favorite from supplied json', :vcr do
        favorite_create_params = { 
          api_key: user.api_key,
          country: 'thailand',
          recipe_link: 'recipe link',
          recipe_title: 'recipe title'
        }
        headers = { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
        post api_v1_favorites_path, headers: headers, params: JSON.generate(favorite_create_params)
        created_favorite = Favorite.last
        
        expect(created_favorite.api_key).to eq(user.api_key)
        expect(created_favorite.country).to eq('thailand')
        expect(created_favorite.recipe_link).to eq('recipe link')
        expect(created_favorite.recipe_title).to eq('recipe title')

        expect(response).to be_successful

        favorite = JSON.parse(response.body, symbolize_names: true)

        expect(favorite).to be_a(Hash)
        expect(favorite).to have_key(:success)
        expect(favorite[:success]).to eq("Favorite added successfully")
      end
    end
  end
end
