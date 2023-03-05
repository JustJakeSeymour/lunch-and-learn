require 'rails_helper'

RSpec.describe 'recipes API endpoint' do
  describe 'requesting a list of recipes for country' do
    context 'happy path' do
      it 'sends a json response of recipes', :vcr do
        get api_v1_recipes_path, params: { 'country' => 'thailand' }

        expect(response).to be_successful

        recipes = JSON.parse(response.body, symbolize_names: true)
        
        expect(recipes).to be_a(Hash)
        expect(recipes).to have_key(:data)
        expect(recipes[:data]).to be_an(Array)
        expect(recipes[:data].first).to have_key(:id)
        expect(recipes[:data].first).to have_key(:type)
        expect(recipes[:data].first[:type]).to eq('recipe')
        expect(recipes[:data].first).to have_key(:attributes)
        expect(recipes[:data].first[:attributes]).to be_a(Hash)
        expect(recipes[:data].first[:attributes]).to have_key(:title)
        expect(recipes[:data].first[:attributes][:title]).to be_a(String)
        expect(recipes[:data].first[:attributes]).to have_key(:url)
        expect(recipes[:data].first[:attributes][:url]).to be_a(String)
        expect(recipes[:data].first[:attributes]).to have_key(:country)
        expect(recipes[:data].first[:attributes][:country]).to be_a(String)
        expect(recipes[:data].first[:attributes]).to have_key(:image)
        expect(recipes[:data].first[:attributes][:image]).to be_a(String)
      end
    end
  end
end
