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
  
  describe 'FINAL ASSESSMENT' do
    context 'return country info by supplied name' do
      it 'returns detailed information when supplied a country name or partial' do
        country = 'peru'
        
        service = CountriesService.one_country(country)
        
        expect(service).to be_an(Array)
        expect(service.first).to be_a(Hash)
        expect(service.first).to have_key(:name)
        expect(service.first[:name]).to be_a(Hash)
        expect(service.first[:name]).to have_key(:common)
        expect(service.first[:name][:common]).to be_a(String)
        
        expect(service.first).to have_key(:capitalInfo)
        expect(service.first[:capitalInfo]).to be_a(Hash)
        expect(service.first[:capitalInfo]).to have_key(:latlng)
        expect(service.first[:capitalInfo][:latlng]).to be_an(Array)
        expect(service.first[:capitalInfo][:latlng].count).to eq(2)
      end
    end
  end
end
