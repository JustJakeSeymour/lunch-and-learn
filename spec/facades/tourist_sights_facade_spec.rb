require 'rails_helper'

RSpec.describe TouristSightsFacade, type: :facade do
  describe 'FINAL ASSESSMENT' do
    context 'class methods' do
      it 'country_latlong' do
        country = 'peru'
        expect(TouristSightsFacade.capital_sights(country)).to be_an(Array)
        expect(TouristSightsFacade.capital_sights(country).first).to be_a(TouristSight)
      end
    end
  end
end
