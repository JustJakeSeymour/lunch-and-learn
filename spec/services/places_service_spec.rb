require 'rails_helper'

RSpec.describe PlacesService, type: :service do
  describe 'FINAL ASSESSMENT' do
    context 'class methods' do
      it 'returns tourism locations in a 2000 meter radius', :vcr do
        capital_latlng = [-12.05, -77.05]
        service = PlacesService.tourism_radius(capital_latlng, 20000)
        
        expect(service).to be_a(Hash)
        expect(service).to have_key(:type)
        expect(service[:type]).to eq('FeatureCollection')
        expect(service).to have_key(:features)
        expect(service[:features]).to be_an(Array)

        expect(service[:features].first).to be_a(Hash)
        expect(service[:features].first).to have_key(:type)
        expect(service[:features].first[:type]).to eq("Feature")
        expect(service[:features].first).to have_key(:properties)
        
        expect(service[:features].first[:properties]).to be_a(Hash)
        expect(service[:features].first[:properties]).to have_key(:name)
        expect(service[:features].first[:properties][:name]).to be_a(String)
        
        expect(service[:features].first[:properties]).to have_key(:address_line1)
        expect(service[:features].first[:properties][:address_line1]).to be_a(String)
        
        expect(service[:features].first[:properties]).to have_key(:address_line2)
        expect(service[:features].first[:properties][:address_line2]).to be_a(String)

        expect(service[:features].first[:properties]).to have_key(:place_id)
        expect(service[:features].first[:properties][:place_id]).to be_a(String)
      end
    end
  end
end