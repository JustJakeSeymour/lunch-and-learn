require 'rails_helper'

RSpec.describe VideosFacade, type: :facade do
  describe 'class methods' do
    context 'call country search result' do
      it 'search_videos', :vcr do
        search = 'mr history thailand'
        expect(VideosFacade.search_videos(search)).to be_a(Video)
      end
    end
  end
end
