require 'rails_helper'

RSpec.describe Video, type: :poro do
  context 'initialize' do
    it 'has attributes' do
      data = {
        video: 'Random Video'
      }
      video = Video.new(data)

      expect(video).to be_a(Video)
      expect(video.video).to eq('Random Video')
    end
  end
end
