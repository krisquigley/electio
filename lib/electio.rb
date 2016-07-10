require "electio/base"
require "electio/connection"
require "electio/configuration"
require "electio/consignment"
require "net/https"
require "uri"
require "json"

module Electio
  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  def self.headers(options = {})
    default_headers.merge(options)
  end

  private

  def self.base_uri
    URI("https://api.electioapp.com/")
  end

  def self.default_headers
    { 
      "ocp-apim-subscription-key" => configuration.api_key,
      "content-type" => "application/json" 
    }
  end
end