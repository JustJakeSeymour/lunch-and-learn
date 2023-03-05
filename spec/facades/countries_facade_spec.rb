require 'rails_helper'

RSpec.describe CountriesFacade, type: :facade do
  describe 'class methods' do
    context 'random country' do
      it 'one_country', :vcr do
        expect(CountriesFacade.one_country).to be_a(Country)
      end
    end
  end
end
