require 'rails_helper'

RSpec.describe 'recipes API endpoint' do
  describe 'requesting a list of recipes for country' do
    context 'happy path' do
      it 'sends a json response of recipes', :vcr do
        get api_v1_recipes_path, params: { 'country' => 'thailand' }

        expect(response).to be_successful

        activity = JSON.parse(response.body, symbolize_names: true)

        expect(activity).to be_a(Hash)
        expect(activity).to have_key(:activity)
        expect(activity[:activity]).to be_a(String)
      end
    end
  end
end
