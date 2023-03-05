require 'rails_helper'

RSpec.describe 'users API endpoint' do
  describe 'happy path testing' do
    context 'create user' do
      it 'creates user from supplied json', :vcr do
        post api_v1_users_path, body: { 'name' => 'name' }

        expect(response).to be_successful

        activity = JSON.parse(response.body, symbolize_names: true)

        expect(activity).to be_a(Hash)
        expect(activity).to have_key(:activity)
        expect(activity[:activity]).to be_a(String)
      end
    end
  end
end
