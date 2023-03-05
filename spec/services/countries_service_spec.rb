require 'rails_helper'

RSpec.describe CountriesService, type: :service do
  context 'class methods' do
    it 'returns a list of countries', :vcr do
      service = CountriesService.all_countries

      expect(service).to be_an(Array)
      expect(service.first).to be_a(Hash)
      expect(service.first).to have_key(:name)
      expect(service.first[:name]).to be_a(Hash)
      expect(service.first[:name]).to have_key(:common)
      expect(service.first[:name][:common]).to be_a(String)
    end
  end
end
