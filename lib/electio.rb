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

  def self.base_uri
    URI("https://api.electioapp.com/")
  end
end