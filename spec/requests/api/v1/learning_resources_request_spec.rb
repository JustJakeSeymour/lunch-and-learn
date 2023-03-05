require 'rails_helper'

RSpec.describe 'learning resources API endpoint' do
  describe 'requesting a video and photos for a country' do
    context 'happy path' do
      it 'sends a json response for a country defined in params', :vcr do
        get api_v1_learning_resources_path, headers: { 'HTTP_FERN_KEY' => ENV['FERN_KEY'] }

        expect(response).to be_successful

        activity = JSON.parse(response.body, symbolize_names: true)

        expect(activity).to be_a(Hash)
        expect(activity).to have_key(:activity)
        expect(activity[:activity]).to be_a(String)
      end
    end
  end
end
