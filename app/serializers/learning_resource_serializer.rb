class LearningResourceSerializer
  def self.format(video, photos, country)
    {
      "data":
        {
          "id": nil,
          "type": "learning_resource",
          "attributes": {
            "country": country,
            "video": {
                "title": video.title,
                "youtube_video_id": video.youtube_video_id
            },
            "images": photos.map do |photo|
                {
                    "alt_tag": photo.alt_tag,
                    "url": photo.url
                }
              end
        }
    }
  }
  end
end