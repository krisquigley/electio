module Electio
  class Carrier < CarrierService
    def self.find(record)
      raise NotImplementedError
    end

    def self.find_by(query)
      raise NotImplementedError
    end

    def self.all(query = "getcarriers")
      super
    end

    def self.update(params)
      raise NotImplementedError
    end

    def initialize
      raise NotImplementedError
    end      
  end
end