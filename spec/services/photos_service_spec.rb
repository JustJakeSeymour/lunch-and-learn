require 'rails_helper'

RSpec.describe PhotosService, type: :service do
  context 'class methods' do
    it 'returns a list of photos pertaining to a country', :vcr do
      country = 'thailand'
      service = PhotosService.country_photos(country)

      expect(service).to be_a(Hash)
      expect(service).to have_key(:activity)
      expect(service[:activity]).to be_a(String)
    end
  end
end
