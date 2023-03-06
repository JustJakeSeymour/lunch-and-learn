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

    context 'return user favorites' do
      it 'favorites index?' do
        user_2 = User.create(name: 'username', email: 'user@email.com', api_key: Faker::Barcode.ean(13))
        favorite_1 = Favorite.create(api_key: user.api_key, country: 'thailand', recipe_link: 'recipe link', recipe_title: 'recipe title')
        favorite_2 = Favorite.create(api_key: user.api_key, country: 'thailand', recipe_link: 'recipe link', recipe_title: 'recipe title')
        favorite_3 = Favorite.create(api_key: user_2.api_key, country: 'thailand', recipe_link: 'recipe link', recipe_title: 'recipe title')

        # favorite_index_params = { 
        #   api_key: user.api_key,
        # }
        headers = { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
        get api_v1_favorites_path, headers: headers, params: { api_key: user.api_key }
        
        expect(response).to be_successful
        
        favorites = JSON.parse(response.body, symbolize_names: true)

        expect(favorites).to be_a(Hash)
        expect(favorites).to have_key(:data)
        expect(favorites[:data]).to be_an(Array)
        expect(favorites[:data].count).to eq(2)
        expect(favorites[:data].first).to be_a(Hash)
        expect(favorites[:data].first).to have_key(:id)
        expect(favorites[:data].first[:id]).to be_a(String)
        expect(favorites[:data].first).to have_key(:type)
        expect(favorites[:data].first[:type]).to eq('favorite')
        expect(favorites[:data].first).to have_key(:attributes)
        expect(favorites[:data].first[:attributes]).to be_a(Hash)
        expect(favorites[:data].first[:attributes]).to have_key(:recipe_title)
        expect(favorites[:data].first[:attributes][:recipe_title]).to be_a(String)
        expect(favorites[:data].first[:attributes]).to have_key(:recipe_link)
        expect(favorites[:data].first[:attributes][:recipe_link]).to be_a(String)
        expect(favorites[:data].first[:attributes]).to have_key(:country)
        expect(favorites[:data].first[:attributes][:country]).to be_a(String)
        expect(favorites[:data].first[:attributes]).to have_key(:created_at)
        expect(favorites[:data].first[:attributes][:created_at]).to be_a(String)
      end
    end
  end
end
