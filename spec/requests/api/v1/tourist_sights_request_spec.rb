require 'rails_helper'

RSpec.describe 'tourist sights API endpoint' do
  describe 'requesting a list of tourist sights for country' do
    context 'happy path' do
      it 'sends a json response of tourist sights', :vcr do
        get api_v1_tourist_sights_path, params: { 'country' => 'peru' }

        expect(response).to be_successful

        tourist_sights = JSON.parse(response.body, symbolize_names: true)
        
        expect(tourist_sights).to be_a(Hash)
        expect(tourist_sights).to have_key(:data)
        expect(tourist_sights[:data]).to be_an(Array)
        expect(tourist_sights[:data].first).to have_key(:id)
        expect(tourist_sights[:data].first).to have_key(:type)
        expect(tourist_sights[:data].first[:type]).to eq('tourist_sight')
        expect(tourist_sights[:data].first).to have_key(:attributes)
        expect(tourist_sights[:data].first[:attributes]).to be_a(Hash)
        expect(tourist_sights[:data].first[:attributes]).to have_key(:name)
        expect(tourist_sights[:data].first[:attributes][:name]).to be_a(String)
        expect(tourist_sights[:data].first[:attributes]).to have_key(:address)
        expect(tourist_sights[:data].first[:attributes][:address]).to be_a(String)
        expect(tourist_sights[:data].first[:attributes]).to have_key(:place_id)
        expect(tourist_sights[:data].first[:attributes][:place_id]).to be_a(String)
      end
    end
  end
end