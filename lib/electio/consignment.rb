module Electio
  class Consignment < Base
    END_POINT = "/consignments/".freeze

    def self.find_by(query)
      raise NotImplementedError
    end

    def self.all
      raise NotImplementedError
    end

    def self.update(params)
      raise NotImplementedError
    end
  end
end