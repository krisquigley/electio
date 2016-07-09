module Electio
  class Configuration
    attr_accessor :api_key

    def initialize
      @api_key = "not_set"
    end
  end
end