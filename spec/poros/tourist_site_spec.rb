require 'rails_helper'

RSpec.describe TouristSight, type: :poro do
  context 'initialize' do
    it 'has attributes' do
      data = {
        address_line1: 'line1',
        address_line2: 'line2',
        name: 'tourist sight name',
        place_id: 'tourist sight place_id'
      }
      tourist_sight = TouristSight.new(data)

      expect(tourist_sight).to be_a(TouristSight)
      expect(tourist_sight.name).to eq('tourist sight name')
      expect(tourist_sight.address).to eq('line1 line2')
      expect(tourist_sight.place_id).to eq('tourist sight place_id')
    end
  end
end
