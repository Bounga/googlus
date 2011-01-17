module Googlus
  # Expands Google shorten URLs
  class Expand
    attr_reader :short_url, :url
    
    # Short URL to expand
    def initialize(url)
      http = Net::HTTP.new("www.googleapis.com", 443)
      http.use_ssl = true
      
      resp, body = http.get("/urlshortener/v1/url?shortUrl=#{url}")
      body = JSON.parse(body)
      
      if resp.code.to_i == 200
        @short_url = body["id"]
        @url = body["longUrl"]
        @kind = body["kind"]
        @status = body["status"]
      else
        error = body["error"]
        raise "Expanding error: #{error["code"]} - #{error["message"]}"
      end
    end
  end
end