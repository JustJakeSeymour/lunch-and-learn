require 'rails_helper'

RSpec.describe Photo, type: :poro do
  context 'initialize' do
    it 'has attributes' do
      data = {
        alt_description: 'Photo Description',
        urls: {
          raw: 'Photo Url'
        }
      }
      photo = Photo.new(data)

      expect(photo).to be_a(Photo)
      expect(photo.alt_tag).to eq('Photo Description')
      expect(photo.url).to eq('Photo Url')
    end
  end
end
