require 'net/http'
require 'net/https'
require 'json'

# Wrapper around Google URL Shortener API
module Googlus
  
end

class Net::HTTP
  alias_method :old_initialize, :initialize
  def initialize(*args)
    old_initialize(*args)
    @ssl_context = OpenSSL::SSL::SSLContext.new
    @ssl_context.verify_mode = OpenSSL::SSL::VERIFY_NONE
  end
end

Dir.glob('lib/googlus/*.rb').each { |f| require f }
