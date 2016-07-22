module Electio
  class Carrier < CarrierService
    def self.find(*)
      raise NotImplementedError
    end

    def self.find_by(*)
      raise NotImplementedError
    end

    def self.all(query = "getcarriers")
      super
    end

    def self.update(*)
      raise NotImplementedError
    end

    def initialize
      raise NotImplementedError
    end      
  end
end