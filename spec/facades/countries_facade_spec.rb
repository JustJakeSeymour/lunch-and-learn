require 'rails_helper'

RSpec.describe CountriesFacade, type: :facade do
  describe 'class methods' do
    context 'random country' do
      it 'random_country', :vcr do
        expect(CountriesFacade.random_country).to be_a(Country)
      end
    end
  end

  describe 'FINAL ASSESSMENT' do
    context 'lat long for capital' do
      it 'latlong' do
        country = 'peru'
        expect(CountriesFacade.latlong(country)).to be_an(Array)
        expect(CountriesFacade.latlong(country)).to eq([-12.05,-77.05])
      end
    end
  end
end
