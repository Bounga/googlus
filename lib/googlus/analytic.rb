module Googlus
  # Retrieve analytics for given short URL
  class Analytic
    attr_reader :response

    # Short URL to analyze
    def initialize(url)
      http = Net::HTTP.new("www.googleapis.com", 443)
      http.use_ssl = true

      resp, body = http.get("/urlshortener/v1/url?shortUrl=#{url}&projection=FULL")
      body = JSON.parse(body)

      if resp.code.to_i == 200
        @response = body
      else
        error = body["error"]
        raise "Request error: #{error["code"]} - #{error["message"]}"
      end
    end
    
    # Pretty printed version of analytics info
    def to_s
      @response.inspect
    end
  end
end