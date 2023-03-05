require 'rails_helper'

RSpec.describe Video, type: :poro do
  context 'initialize' do
    it 'has attributes' do
      data = {
        id: 'Video ID',
        snippet: {
          title: 'Video Title'
        }
      }
      video = Video.new(data)

      expect(video).to be_a(Video)
      expect(video.youtube_video_id).to eq('Video ID')
      expect(video.title).to eq('Video Title')
    end
  end
end
