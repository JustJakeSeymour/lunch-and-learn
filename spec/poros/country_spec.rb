require 'rails_helper'

RSpec.describe Country, type: :poro do
  context 'initialize' do
    it 'has attributes' do
      data = {
        country: 'Random Country'
      }
      country = Country.new(data)

      expect(country).to be_a(Country)
      expect(country.country).to eq('Random Country')
    end
  end
end