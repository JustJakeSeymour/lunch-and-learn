require 'rails_helper'

RSpec.describe Photo, type: :poro do
  context 'initialize' do
    it 'has attributes' do
      data = {
        photo: 'Random Photo'
      }
      photo = Photo.new(data)

      expect(photo).to be_a(Photo)
      expect(photo.photo).to eq('Random Photo')
    end
  end
end
