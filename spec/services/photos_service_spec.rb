require 'rails_helper'

RSpec.describe PhotosService, type: :service do
  context 'class methods' do
    it 'returns a list of photos pertaining to a country', :vcr do
      country = 'thailand'
      service = PhotosService.country_photos(country)
      
      expect(service).to be_an(Array)
      expect(service.first).to be_a(Hash)
      expect(service.first).to have_key(:alt_description)
      expect(service.first[:alt_description]).to be_a(String)
      expect(service.first).to have_key(:urls)
      expect(service.first[:urls]).to have_key(:raw)
      expect(service.first[:urls][:raw]).to be_a(String)
    end
  end
end
