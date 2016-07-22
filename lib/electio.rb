require "electio/base"
require "electio/account"
require "electio/allocation"
require "electio/carrier_service"
require "electio/carrier"
require "electio/connection"
require "electio/configuration"
require "electio/consignment"
require "electio/label"
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