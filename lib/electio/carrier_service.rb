module Electio
  class CarrierService < Base
    END_POINT = "/carriers/".freeze

    def self.find(record)
      raise NotImplementedError
    end

    def self.find_by(query)
      raise NotImplementedError
    end

    def self.update(params)
      raise NotImplementedError
    end

    def initialize
      raise NotImplementedError
    end  
  end
end