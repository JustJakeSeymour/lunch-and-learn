require 'rails_helper'

RSpec.describe 'users API endpoint' do
  describe 'happy path testing' do
    context 'create user' do
      it 'creates user from supplied json', :vcr do
        user_create_params = { 
          name: 'name',
          email: 'user email'
        }
        headers = { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
        post api_v1_users_path, headers: headers, params: JSON.generate(user_create_params)
        created_user = User.last

        expect(created_user.name).to eq('name')
        expect(created_user.email).to eq('user email')
        expect(created_user.api_key).to be_a(String)

        expect(response).to be_successful

        user = JSON.parse(response.body, symbolize_names: true)

        expect(user).to be_a(Hash)
        expect(user).to have_key(:data)
        expect(user[:data]).to be_a(Hash)
        expect(user[:data]).to have_key(:type)
        expect(user[:data][:type]).to be_a(String)
        expect(user[:data][:type]).to eq('user')
        expect(user[:data]).to have_key(:id)
        expect(user[:data][:id]).to be_a(String)
        expect(user[:data]).to have_key(:attributes)
        expect(user[:data][:attributes]).to be_a(Hash)
        expect(user[:data][:attributes]).to have_key(:name)
        expect(user[:data][:attributes][:name]).to be_a(String)
        expect(user[:data][:attributes]).to have_key(:email)
        expect(user[:data][:attributes][:email]).to be_a(String)
        expect(user[:data][:attributes]).to have_key(:api_key)
        expect(user[:data][:attributes][:api_key]).to be_a(String)
      end
    end
  end
end
