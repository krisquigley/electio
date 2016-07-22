require 'plissken'

module Electio
  class Tracking < Base
    END_POINT = "/tracking/".freeze
  
    def self.find(*)
      raise NotImplementedError
    end

    def self.find_by(query)
      query = { "" => query.values.first } if query.keys.first == :consignment_reference
      super
    end

    def self.all
      raise NotImplementedError
    end

    def self.update(*)
      raise NotImplementedError
    end

    def initialize
      raise NotImplementedError
    end      
  end
end