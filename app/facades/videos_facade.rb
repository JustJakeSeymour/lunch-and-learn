class VideosFacade
  def self.search_videos(search)
    id = VideosService.search_videos(search)[:items].first[:id][:videoId]
    json = info(id)[:items].first
    video_result(json)
  end

  def self.info(id)
    VideosService.info(id)
  end

  def self.video_result(json)
      Video.new(json)
  end
end