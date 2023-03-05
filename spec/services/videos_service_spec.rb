require 'rails_helper'

RSpec.describe VideosService, type: :service do
  context 'class methods' do
    it 'returns a list of videos', :vcr do
      search  = 'mr history thailand'
      service = VideosService.search_videos(search)

      expect(service).to be_a(Hash)
      expect(service).to have_key(:activity)
      expect(service[:activity]).to be_a(String)
    end
  end
end
