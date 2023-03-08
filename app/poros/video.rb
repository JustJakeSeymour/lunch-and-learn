class Video
  attr_reader :title,
              :youtube_video_id

  def initialize(data)
    @title = title_or_nil(data)
    @youtube_video_id = id_or_nil(data)
  end

  def title_or_nil(data)
    if data
      data[:snippet][:title]
    else
      nil
    end
  end

  def id_or_nil(data)
    if data
      data[:id]
    else
      nil
    end
  end
end