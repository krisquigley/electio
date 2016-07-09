module Electio
  class Connection
    attr_accessor :uri, :params

    def initialize(options = {})
      self.uri    = Electio.base_uri.merge(options.fetch(:end_point))
      self.params = options[:params].to_json
    end

    def connect(&block)
      http = Net::HTTP.new(uri, 443, params)
      block.yield(http)
    ensure
      http.close
    end
  end
end