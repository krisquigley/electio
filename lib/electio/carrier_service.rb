module Electio
  class CarrierService < Base
    END_POINT = "/carriers/".freeze

    def self.find
      raise NotImplementedError
    end

    def self.update
      raise NotImplementedError
    end

    def initialize
      raise NotImplementedError
    end  
  end
end