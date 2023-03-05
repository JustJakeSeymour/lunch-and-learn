require 'rails_helper'

RSpec.describe 'learning resources API endpoint' do
  describe 'requesting a video and photos for a country' do
    context 'happy path' do
      it 'sends a json response for a country defined in params', :vcr do
        get api_v1_learning_resources_path, params: { 'country' => 'thailand' }

        expect(response).to be_successful

        learning_resource = JSON.parse(response.body, symbolize_names: true)
        
        expect(learning_resource).to be_a(Hash)
        expect(learning_resource).to have_key(:data)
        expect(learning_resource[:data]).to be_a(Hash)
        expect(learning_resource[:data]).to have_key(:id)
        expect(learning_resource[:data]).to have_key(:type)
        expect(learning_resource[:data][:type]).to eq('learning_resource')
        expect(learning_resource[:data]).to have_key(:attributes)
        expect(learning_resource[:data][:attributes]).to be_a(Hash)
        expect(learning_resource[:data][:attributes]).to have_key(:country)
        expect(learning_resource[:data][:attributes][:country]).to be_a(String)
        expect(learning_resource[:data][:attributes]).to have_key(:video)
        expect(learning_resource[:data][:attributes][:video]).to be_a(Hash)
        expect(learning_resource[:data][:attributes][:video]).to have_key(:title)
        expect(learning_resource[:data][:attributes][:video][:title]).to be_a(String)
        expect(learning_resource[:data][:attributes][:video]).to have_key(:youtube_video_id)
        expect(learning_resource[:data][:attributes][:video][:youtube_video_id]).to be_a(String)
        expect(learning_resource[:data][:attributes]).to have_key(:images)
        expect(learning_resource[:data][:attributes][:images]).to be_an(Array)
        expect(learning_resource[:data][:attributes][:images].first).to be_a(Hash)
        expect(learning_resource[:data][:attributes][:images].first).to have_key(:alt_tag)
        expect(learning_resource[:data][:attributes][:images].first[:alt_tag]).to be_a(String)
        expect(learning_resource[:data][:attributes][:images].first).to have_key(:url)
        expect(learning_resource[:data][:attributes][:images].first[:url]).to be_a(String)
      end
    end
  end
end
