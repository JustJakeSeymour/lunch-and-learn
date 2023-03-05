require 'rails_helper'

RSpec.describe VideosService, type: :service do
  context 'class methods' do
    it 'returns a list of videos', :vcr do
      search  = 'mr history thailand'
      service = VideosService.search_videos(search)

      expect(service).to be_a(Hash)
      expect(service).to have_key(:items)
      expect(service[:items]).to be_an(Array)

      expect(service[:items].first).to be_a(Hash)
      expect(service[:items].first).to have_key(:id)
      expect(service[:items].first[:id]).to be_a(Hash)
      
      expect(service[:items].first[:id]).to have_key(:videoId)
      expect(service[:items].first[:id][:videoId]).to be_a(String)

    end
  end
end
