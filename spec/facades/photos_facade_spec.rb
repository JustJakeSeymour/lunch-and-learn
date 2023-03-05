require 'rails_helper'

RSpec.describe PhotosFacade, type: :facade do
  describe 'class methods' do
    context 'call country search result' do
      it 'country_photos', :vcr do
        country = 'thailand'
        expect(PhotosFacade.country_photos(country)).to be_an(Array)
        expect(PhotosFacade.country_photos(country).first).to be_a(Photo)
      end
    end
  end
end
