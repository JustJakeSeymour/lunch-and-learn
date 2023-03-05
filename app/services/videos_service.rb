class VideosService
  def self.search_videos(search)
    response = conn.get("search?q=#{search}")
    parse_json(response)
  end
  
  def self.info(id)
    response = conn.get("videos?part=snippet&id=#{id}&fields=items(id%2Csnippet)")
    parse_json(response)
  end

  def self.conn
    Faraday.new(url: 'https://www.googleapis.com/youtube/v3/') do |f|
      f.params['key'] = ENV['youtube_api_key']
    end
  end

  def self.parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
